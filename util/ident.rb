#!/usr/bin/env ruby
require_relative "../lib/ident"
require 'slop'
require 'thread'

include Intrigue::Ident
include Intrigue::Ident::Utils

def allowed_protocols
  ["ftp", "smtp", "snmp"]
end

def check_single_ip(opts)
  
  unless opts[:proto]
    puts "Unable to continue, protocol must be specified!"
    puts "Use the --proto option!"
    return
  end
  
  ip = opts[:ip]
  port = opts[:port]

  if opts[:proto] == "ftp"
    results = generate_ftp_request_and_check(ip, port || 21)
  elsif opts[:proto] == "snmp"
    results = generate_snmp_request_and_check(ip, port || 161)
  elsif  opts[:proto] == "smtp"
    results = generate_smtp_request_and_check(ip, port || 25)
  else 
    puts "Error! Unknown protocol!"
    puts "We know about the following: #{allowed_protocols.join(", ")}"
  end

  puts "Got Results:"
  puts results.inspect

end


def check_file_urls(opts)

  filepath = opts[:file]
  debug = opts[:debug]

  # push all urls into a queue
  work_q = Queue.new
  output_q = Queue.new

  puts "Parsing file #{filepath}" if debug 
  File.open(filepath,"r").each_line{|x| work_q << x.chomp }

  #puts "Checking: #{work_q.inspect}" if debug
  num_threads = opts[:threads] || 3
  workers = (0...num_threads).map do
    Thread.new do
      begin
        while x = work_q.pop(true)

          thread_name = "thread-#{rand(9999999)}"
          puts "#{thread_name} checking: #{x}" if debug

          check_result = generate_http_requests_and_check(x,opts)

          out = {}
          out["url"] = check_result["url"]

          # get the fingerprint component, uniq it 
          if check_result["fingerprint"]
            out["fingerprint"] = []
            check_result["fingerprint"].each do |x|
              
              # Make sure not to include dupes, unless we're debugging 
              next if out["fingerprint"].include?(x) unless debug

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

  # Write the file 
  write_simple_csv(output_q)

end

def check_single_url(opts)

  query_vulns = opts[:vulnerabilities] || false
  debug = opts[:debug]
  json = opts[:json] || false

  if opts[:url] 

    url = opts[:url]

    unless url =~ /^http[s]?:\/\/.*$/
      puts "Unable to parse URL (#{url}), please append http or https in front."
      exit
    end

    check_result = generate_http_requests_and_check(url, opts)

    if debug 
      puts "Ran #{check_result["initial_checks"].first["count"]} checks against base URL"
      if !check_result["followon_checks"].empty?
        puts "Also checked the following urls due to initial fingerprint:"
        check_result["followon_checks"].each{|x| puts " - #{x["url"]}\n" }
      end
    end 
    
    unless check_result
      puts "Error... unable to get matches!"
      exit -1
    end

    #
    # Handle debug output 
    #
    if debug
      i= 0
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
      check_result["fingerprint"].each do |x|
        
        # Make sure not to include dupes, unless we're debugging 
        #next if uniq_matches.include? "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}" #unless debug

        uniq_matches << "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
        
        # otherwise, print it out
        puts " - #{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]} - #{x["match_details"]} (CPE: #{x["cpe"]}) (Tags: #{x["tags"]}) (Hide: #{x["hide"]})"
        if query_vulns
          vulns = Intrigue::Vulndb::Client.query(nil, x["cpe"]) || []
          vulns.sort_by{|x| x["cvss_v3_score"] || 0 }.reverse.first(5).each do |v|
            puts "   - Vuln: #{v["cve"]} (CVSSv3: #{v["cvss_v3_score"]})"
          end
        end
      end
    end

    if opts[:content] 
      puts "Content Checks:"
      if check_result["content"]
        check_result["content"].each do|x|
          puts " - #{x["name"]}: #{x["result"]}"
        end
      end
    end

    puts JSON.pretty_generate(check_result) if json
  end 
end

  # Write the file 
def write_simple_csv(output_q)
  headings = [] 
  headings << "URL"
  headings << "Fingerprint"
  File.open("output.csv","w") { |f| f.puts headings.join(", ") }

  while output_q.size > 0 do
    
    # get a result
    o = output_q.pop

    # get our url, fingerprint and tags
    out = ""
    o["fingerprint"].uniq.map do |f|
      out << "#{o["url"]}, #{f["vendor"]} #{f["product"]} #{f["version"]} #{f["update"]}\n"
    end

    # print it out! 
    File.open("output.csv","a"){ |f| f.puts out }
  end

  puts 
  puts "============================" 
  puts "Find results in: output.csv"
  puts "============================"


end

def write_standard_csv(output_q)

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

end

def main

  begin 
    ###
    ### Parse options
    ###
    opts = Slop.parse do |o|
      
      # url input
      o.string '-u', '--url', 'a url to check'
      o.string '-f', '--file', 'a file of urls, one per line'

      # ip input
      o.string '--ip', 'an ip to check'
      o.string '--proto', 'protocol to check'
      o.string '--port', 'port to check'

      # export 
      #o.bool '--csv', 'export to csv'
      o.bool '--json', 'export to json'

      # behavior
      o.string  '-i', '--include', 'include checks from this directory (can be used multiple times)'
      o.integer '-t', '--threads', 'number of threads to use when checking a file (default: 3)'
      o.bool    '-v', '--vulnerabilities', 'query intrigue.io api for top vulnerabilities'
      o.bool    '-c', '--content', 'show content checks'
      o.bool    '-b', '--only-check-base-url', 'only base url '
      o.bool    '-d', '--debug', 'enable debug mode'

      o.on "-h", "--help" do
        puts o
        exit
      end

      o.on '--version', 'print the version' do
        puts Ident::VERSION
        exit
      end

    end
  rescue Slop::MissingArgument => e
    puts "Error! #{e}"
    return
  end

  unless opts[:url] || opts[:file] || opts[:ip]
    puts "Error! At least one of --file, --url, or --ip must be specified"
    return
  end

  ## include external checks
  if opts[:include]
    puts "Including checks from path: #{opts[:include]}"
    
    # follow directory structure from ident
    Dir.glob("#{opts[:include]}/checks/*/*.rb").each do |p|
      puts "Requiring include path: #{p}"
      require p
    end
    
  end 

  ## handle url input
  if opts[:url]
    puts "Checking URL: #{opts[:url]}" if opts[:debug]
    check_single_url(opts)
  end 

  ## handle file input 
  if opts[:file]
    puts "Checking File: #{opts[:file]}" if opts[:debug]
    check_file_urls(opts)
  end

  ## handle ip input
  if opts[:ip]
    puts "Checking IP: #{opts[:ip]}"  if opts[:debug]
    check_single_ip(opts)
  end
end

main  
