#!/usr/bin/env ruby
require_relative "../lib/ident"
require 'slop'
require 'thread'

include Intrigue::Ident
include Intrigue::Ident::Utils

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

def check_single_uri(opts)

  query_vulns = opts[:vulnerabilities] || false
  debug = opts[:debug]
  json = opts[:json] || false

  if uri = opts[:uri]

    if uri =~ /^http[s]?:\/\/.*$/      
      check_result = generate_http_requests_and_check(uri, opts)
      if debug 
        puts "Ran #{check_result["initial_checks"].first["count"]} checks against base URL"
        if !check_result["followon_checks"].empty?
          puts "Also checked the following urls due to initial fingerprint:"
          check_result["followon_checks"].each{|x| puts " - #{x["url"]}\n" }
        end
      end 
  
      #
      # Handle debug output for https  
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

    else # not http 

      parsed_uri = URI(uri)
      
      proto = "#{parsed_uri.scheme}".downcase 
      ip = parsed_uri.hostname
      port = parsed_uri.port

      puts "Checking ... PROTO: #{proto} | HOST: #{ip} | PORT: #{port || "default"}" if debug
    
      if proto == "dns"
        check_result = generate_dns_request_and_check(ip, port || 53)
      elsif proto == "ftp"
        check_result = generate_ftp_request_and_check(ip, port || 21)
      elsif proto == "snmp"
        check_result = generate_snmp_request_and_check(ip, port || 161)
      elsif  proto == "smtp"
        check_result = generate_smtp_request_and_check(ip, port || 25)
      elsif  proto == "ssh"
        check_result = generate_ssh_request_and_check(ip, port || 22)
      elsif  proto == "telnet"
        check_result = generate_telnet_request_and_check(ip, port || 23)
      else 
        puts "Unable to parse URI (#{uri}). Check -h for supported protocols"
        exit
      end
    end

    unless check_result
      puts "Internal Error! Unable to get matches!"
      exit -1
    end

    if debug 
      puts "Got Check Result:"
      puts check_result
    end


    if check_result["fingerprint"]
      puts "Fingerprint: "
      uniq_matches = []
      check_result["fingerprint"].each do |x|
        
        # Make sure not to include dupes, unless we're debugging 
        #next if uniq_matches.include? "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}" #unless debug

        uniq_matches << "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
        
        # otherwise, print it out
        puts " - #{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]} - #{x["match_details"]} (CPE: #{x["cpe"]}) (Tags: #{x["tags"]}) (Hide: #{x["hide"]}) (Issues: #{x["issues"]}) (Tasks: #{x["tasks"]})"
        if query_vulns
          vulns = Intrigue::Vulndb::Client.query(nil, x["cpe"]) || []
          vulns.sort_by{|x| x["cvss_v3_score"] || x["cvss_v2_score"] || 1 }.reverse.first(5).each do |v|
            puts "   - Vuln: #{v["cve"]} (CVSS: #{v["cvss_v3_score"] || v["cvss_v2_score"]}) https://nvd.nist.gov/vuln/detail/#{v["cve"]}"
          end
        end
      end
    else 
      puts "No fingerprint possible!"
    end

    if opts[:content]
      if check_result["content"]
        puts "Content Checks:"
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

def list_checks
  Intrigue::Ident::Http::CheckFactory.checks.map{|x| x.new.generate_checks("[uri]") }.concat(
  Intrigue::Ident::Dns::CheckFactory.checks.map{|x| x.new.generate_checks }).concat(
  Intrigue::Ident::Ftp::CheckFactory.checks.map{|x| x.new.generate_checks }).concat(
  Intrigue::Ident::Smtp::CheckFactory.checks.map{|x| x.new.generate_checks }).concat(
  Intrigue::Ident::Snmp::CheckFactory.checks.map{|x| x.new.generate_checks }).concat(
  Intrigue::Ident::Ssh::CheckFactory.checks.map{|x| x.new.generate_checks }).concat(
  Intrigue::Ident::Telnet::CheckFactory.checks.map{|x| x.new.generate_checks }).flatten
end

def main

  begin 
    ###
    ### Parse options
    ###
    opts = Slop.parse do |o|
      
      # url input
      o.string '-u', '--uri', 'a uri to check (supported portocols: dns, ftp, http, https, smtp, snmp, telnet)'
      o.string '-f', '--file', 'a file of urls, one per line'

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
      o.bool    '-l', '--list-checks', 'just list checks'  

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

  ## include external checks
  if opts[:include]
    puts "Including checks from path: #{opts[:include]}" if opts[:debug]
    
    # follow directory structure from ident
    Dir.glob("#{opts[:include]}/checks/*/*.rb").each do |p|
      puts "Requiring include path: #{p}" if opts[:debug]
      require p
    end
    
  end 

  if opts[:'list-checks']
    list_checks.sort_by{|c| "#{c[:type]}" }.each {|c| 
    puts " - #{c[:type]} ... #{c[:name]} #{c[:vendor]} #{c[:product]} #{c[:version]}" + 
        " (Version detection: #{!c[:dynamic_version].nil?})" + 
        " (Hide: #{c[:hide]})" + 
        " (Vulns: #{c[:inference]})" + 
        " #{c[:paths]} ... #{c[:tags]}"}
    return
  end

  unless opts[:uri] || opts[:file] 
    puts "Error! At least one of --file, or --uri must be specified"
    return
  end

  ## handle url input
  if opts[:uri]
    puts "Checking URL: #{opts[:uri]}" if opts[:debug]
    check_single_uri(opts)
  end 

  ## handle file input 
  if opts[:file]
    puts "Checking File: #{opts[:file]}" if opts[:debug]
    check_file_uris(opts)
  end
  
end

main  
