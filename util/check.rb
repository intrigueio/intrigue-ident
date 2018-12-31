#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

url = "#{ARGV[0]}"
debug = "#{ARGV[1]}" == "debug"

unless url =~ /^http[s]?:\/\/.*$/
  puts "Unable to parse URL, please append http or https in front."
  return
end

puts "Checking... #{url}"
check_result = generate_http_requests_and_check(url)

unless check_result
  puts "Error... unable to get matches!"
  exit -1
end

if debug
  i= 0
  puts "Requests: "

  if check_result["requests"]

    # delete any existing file
    File.delete "requests.txt" if File.exist? "requests.txt"

    check_result["requests"].sort_by{|r| "#{r[:request_type].to_s.upcase}"}.each do|x|

      # increment the request number
      i+=1

      # print it
      puts "#{i}) #{x[:request_type].to_s.upcase} #{x[:request_method].to_s.upcase} #{x[:start_url]} -> #{x[:final_url]} (#{x[:request_attempts_used] || 1}/#{x[:request_attempts_limit]||1})"

      # write the contents to a file
      File.open("requests.txt","a") do |f|
        f.puts "Request #{i}\n #{x[:response_headers].join("\n") if x[:response_headers]}\n#{x[:response_body]}\n\n\n"
      end

    end
  end
end

puts "Fingerprint: "
if check_result["fingerprint"]
  uniq_matches = []
  check_result["fingerprint"].each do|x|
    # Make sure not to print dupes
    next if uniq_matches.include? "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
    uniq_matches << "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
    # otherwise, print it out
    puts " - #{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]} - #{x["match_details"]} (Tags: #{x["tags"]})"
  end
end

puts "Configuration: "
if check_result["configuration"]
  check_result["configuration"].each do|x|
    puts " - #{x["name"]}: #{x["result"]}"
  end
end