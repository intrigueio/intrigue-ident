#!/usr/bin/env ruby
require 'thread'
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

filepath = ARGV[0]
#puts "Using File: #{filepath}"

# push all urls into a queue
work_q = Queue.new
File.open(filepath,"r").each_line{|url| work_q.push url }

workers = (0...9).map do
 Thread.new do
   begin
     while url = work_q.pop(true)
       url = url.chomp
       #puts "Checking: #{url}"
       check_result = generate_http_requests_and_check(url)

       unless check_result
         puts "Error... unable to get matches!"
         exit -1
       end

       if check_result["fingerprint"]
         File.open("fingerprints.csv","a") do |f|
           uniq_matches = []
           check_result["fingerprint"].each do|x|
             # Make sure not to print dupes
             next if uniq_matches.include? "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
             uniq_matches << "#{x["vendor"]} #{x["product"]} #{x["version"]} #{x["update"]}"
             # otherwise, print it out
             out =  "#{url},#{x["vendor"]},#{x["product"]},#{x["version"]},#{x["update"]}\n"
             puts "FP: #{out}"
             f.puts out
           end
         end
       end

       if check_result["configuration"]
         File.open("configurations.csv","a") do |f|
           check_result["configuration"].each do |x|
             out = "#{url}, #{x["name"]}, #{x["result"]}"
             puts "CF: #{out}"
             f.puts out
           end
         end
       end
     end
   #rescue ThreadError
   end
 end
end; "ok"
workers.map(&:join); "ok"



