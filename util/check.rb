#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

url = ARGV[0]
puts "Checking... #{url}"
check_result = generate_http_requests_and_check(url)

unless check_result
  puts "Error... unable to get matches!"
  exit -1
end

puts "Requests: "
if check_result["requests"]
  check_result["requests"].each do|x|
    puts " - #{x[:request_type].to_s.upcase} #{x[:request_method].to_s.upcase} #{x[:start_url]} -> #{x[:final_url]} (#{x[:request_attempts_used] || 1}/#{x[:request_attempts_limit]||1})"
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