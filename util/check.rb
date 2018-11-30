#!/usr/bin/env ruby
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

url = ARGV[0]
debug = ARGV[1] || nil
puts "Checking... #{url}"
matches = generate_http_requests_and_check(url)

if debug
  puts "Debug: #{url}"
  response = _http_request :get, "#{url}"
  puts "Headers:"
  response.each_header {|x| puts " - #{x}: #{response[x]}" }
  puts "Body:"
  puts response.body
end

puts "Fingerprint: "
matches.each do|x|
  next unless x["type"] == "fingerprint"
  puts " - #{x["vendor"]} #{x["product"]} #{x["version"]} - #{x["match_details"]} (Tags: #{x["tags"]})"
end

puts "Configuration: "
matches.each do|x|
  next unless x["type"] == "configuration"
  puts " - #{x["name"]}: #{x["result"]}"
end

#puts "Vulnerabilities: "