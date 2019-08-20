#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
require 'slop'
require 'thread'

include Intrigue::Ident
include Intrigue::Ident::Utils

###
### Parse options
###
opts = Slop.parse do |o|
  o.string '-u', '--url', 'a single url to check'
  o.string '-f', '--file', 'a file of URLs, one per line'
  o.integer '-t', '--threads', 'number of threads to use (default: 3)'
  o.bool '-v', '--vulnerabilities', 'query intrigue.io api for vulnerabilities'
  o.bool '-b', '--browser', 'use browser checks (slows things down)'
  o.bool '-d', '--debug', 'enable debug mode'
  o.bool '-e', '--export', 'export to csv'
  o.on '--version', 'print the version' do
    puts "Ident v0.3"
    exit
  end
end

enable_browser = opts[:browser] || false
query_vulns = opts[:vulnerabilities] || false
debug = opts[:debug]


if opts[:url] 

  url = opts[:url]

  unless opts[:url] =~ /^http[s]?:\/\/.*$/
    puts "Unable to parse URL (#{url}), please append http or https in front."
    exit
  end

  puts "Checking... #{url}"
  check_result = generate_http_requests_and_check(url,enable_browser,debug)

  unless check_result
    puts "Error... unable to get matches!"
    exit -1
  end


  if debug
    i= 0
    puts "Requests:"

    if check_result["requests"]

      # delete any existing file
      File.delete "debug.txt" if File.exist? "debug.txt"

      check_result["requests"].sort_by{|r| "#{r[:request_type].to_s.upcase}"}.each do |x|

        safex = encode_hash x 

        # increment the request number
        i+=1

        # print it
        puts "#{i}) #{x[:request_type].to_s.upcase} #{x[:request_method].to_s.upcase} #{x[:start_url]} -> #{x[:final_url]} (#{x[:request_attempts_used] || 1}/#{x[:request_attempts_limit]||1})"

        # write the contents to a file
        File.open("requests.txt","a") do |f|
          f.puts "Request #{i}\n #{JSON.pretty_generate (safex)}\n\n\n\n"
        end

      end
    end
  end

  puts "Fingerprint:"
  if check_result["fingerprint"]
    uniq_matches = []
    check_result["fingerprint"].each do|x|
      # Make sure not to print dupes
      next if uniq_matches.include? "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
      uniq_matches << "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
      # otherwise, print it out
      puts " - #{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]} - #{x["match_details"]} (CPE: #{x["cpe"]}) (Tags: #{x["tags"]})"
      if query_vulns
        vulns = Intrigue::Vulndb::Client.query(nil, x["cpe"]) || []
        vulns.sort_by{|x| x["cvss_v3_score"]}.reverse.first(10).each do |v|
          puts "   - Vuln: #{v["cve"]} (CVSSv3: #{v["cvss_v3_score"]})"
        end
      end
    end
  end

  puts "Content Checks:"
  if check_result["content"]
    check_result["content"].each do|x|
      puts " - #{x["name"]}: #{x["result"]}"
    end
  end

  #puts "DEBUG: "
  #puts check_result
  #puts 

elsif opts[:file] 

  filepath = opts[:file]

  # push all urls into a queue
  work_q = Queue.new
  output_q = Queue.new
  File.open(filepath,"r").each_line{|x| work_q << x.chomp }

  #puts "Checking: #{work_q.inspect}" if debug
  num_threads = opts[:threads] || 3
  workers = (0...num_threads).map do
    Thread.new do
      begin
        while x = work_q.pop(true)

          thread_name = "thread-#{rand(9999999)}"

          puts "#{thread_name} checking: #{x}"
          check_result = generate_http_requests_and_check(x,enable_browser,debug)

          out = {}
          out["url"] = check_result["url"]

          # get the fingerprint component, uniq it 
          if check_result["fingerprint"]
            out["fingerprint"] = []
            check_result["fingerprint"].each do |x|
              next if out["fingerprint"].include?(x) # Make sure not to include dupes
              out["fingerprint"] << x
            end
          end

          # get all the content check values as hash entries
          if check_result["content"]
            out["content"] = {}
            check_result["content"].each do |x|
              out["content"]["#{x["name"]}"] = x["result"]
            end
          end

          puts "#{thread_name} #{x} gave result: #{out}" if debug

          output_q << out

        end # while
      rescue StandardError => e
        puts "EXCEPTION! #{e}"
      rescue ThreadError
      end # begin
    end # thread
  end; "ok" # workers 
  workers.map(&:join); "ok"

  # first grab headings & add those to the file
  f = output_q.pop(true)

  headings = [] 
  headings << "URL"
  headings << "Fingerprint"
  headings << "Tags"
  headings.concat f["content"].keys
  File.open("output.csv","w") { |f| f.puts headings.join(",") }
  output_q.push f # put it back on the queue 

  # then, using that header ordering, iterate through out and grab each value
  while output_q.size > 0 do
    o = output_q.pop

    # get our url, fingerprint and tags
    out = "#{o["url"]},"
    out << o["fingerprint"].map{ |f| "#{f["vendor"]} #{f["product"]} #{f["version"]} #{f["update"]}"}.uniq.join(" | ")
    out << ","
    out << o["fingerprint"].map{ |f| "#{f["tags"].join(" ")} "}.uniq.join(" ")
    out << ","

    # dynamically dump all config values in the correct orders
    config_values  = []
    headings[3..-1].each do |h|
      puts "Getting value for #{h}: #{o["content"][h]}" if debug
      config_values << "#{o["content"][h]}"
    end
    out << config_values.join(",")

    # print it out! 
    File.open("output.csv","a"){ |f| f.puts out }
  end

  puts 
  puts "============================" 
  puts "Find results in: output.csv"
  puts "============================"

else 
  puts "Error! Unknown input. Failing!"
  exit
end  
