#!/usr/bin/env ruby
require 'thread'
require_relative "../lib/intrigue-ident"
include Intrigue::Ident

filepath = ARGV[0]

# push all urls into a queue
work_q = Queue.new
output_q = Queue.new
File.open(filepath,"r").each_line{|url| work_q.push url }

output_q << "URL,FINGERPRINT,AUTH_HTTP,AUTH_FORMS,AUTH_ANY\n"

workers = (0...9).map do
 Thread.new do
   begin
     while url = work_q.pop(true)
       url = url.chomp
       puts "Checking: #{url}"
       check_result = generate_http_requests_and_check(url)

       out = {}

       unless check_result
         puts "Error... unable to get matches!"
         exit -1
       end

       if check_result["fingerprint"]
         uniq_matches = []
         check_result["fingerprint"].each do |x|
           # Make sure not to print dupes
           next if uniq_matches.include? x
           fp
         end
       end

       if check_result["content"]
         check_result["content"].each do |x|
           out.merge{x["name"] => x["result"] }
         end
       end

       puts out

     end
   rescue ThreadError
   end
 end
end; "ok"
workers.map(&:join); "ok"


File.open("ident.csv","a") do |f|

end