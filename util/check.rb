#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

url = ARGV[0]
puts "Checking... #{url}"
matches = generate_http_requests_and_check(url)

unless matches
  puts "Error... unable to get matches!"
  exit -1
end

puts "Fingerprint: "
if matches["fingerprint"]
  uniq_matches = []
  matches["fingerprint"].each do|x|
    # Make sure not to print dupes
    next if uniq_matches.include? "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
    uniq_matches << "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
    # otherwise, print it out 
    puts " - #{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]} - #{x["match_details"]} (Tags: #{x["tags"]})"
  end
end

puts "Configuration: "
if matches["configuration"]
  matches["configuration"].each do|x|
    puts " - #{x["name"]}: #{x["result"]}"
  end
end