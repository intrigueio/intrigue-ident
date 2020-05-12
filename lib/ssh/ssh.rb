module Intrigue
  module Ident
    module Ssh

      include Intrigue::Ident::SimpleSocket

      def grab_banner_ssh(ip, port, timeout=30)
          
        if socket = connect_tcp(ip, port, timeout)
          #socket.writepartial("HELO friend.local\r\n\r\n")
          begin 
            out = socket.readpartial(2048, timeout: timeout)
          rescue Socketry::TimeoutError
            puts "Error while reading! Timeout."
            out = nil
          end
        else 
          out = nil
        end
        
      out
      end

      def generate_ssh_request_and_check(ip, port=25, debug=false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_ssh(ip,port)
        details = {
          "details" => {
            "banner" => banner_string
          }
        }
  
        results = []
  
        # generate the checks 
        checks = Intrigue::Ident::Ssh::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten
  
        # and run them against our result
        checks.each do |check|
          results << match_ssh_response_hash(check,details)
        end
  
      results.map{|x| (x || {}).merge({"banner" => banner_string})}.uniq.compact
      end


    end
  end
end
