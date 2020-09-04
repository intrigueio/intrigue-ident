module Intrigue
  module Ident
    module Mysql

      include Intrigue::Ident::SimpleSocket

      # gives us the recog mysql matchers 
      include Intrigue::Ident::RecogWrapper::Mysql

      def generate_mysql_request_and_check(ip, port=3306, debug=false)

        # do the request (store as string and funky format bc
        # of usage in core.. and json conversions)
        
        # Future, actually log in 
        #banner_string = grab_banner_mysql(ip,port)
        
        error_string = grab_error_mysql(ip,port)
        
        details = {
          "details" => {
            #"banner" => nil, #banner_string
            "error" => error_string
          }
        }
  
        results = []
  
        # generate the checks 
        checks = Intrigue::Ident::Mysql::CheckFactory.checks.map{ |x| 
          x.new.generate_checks }.compact.flatten
  
        # and run them against our result
        checks.each do |check|
          results << match_mysql_response_hash(check,details)
        end
  
        # Run recog across the error
        #recog_results = recog_match_mysql_error(error_string)
        recog_results = []
  
        { 
          "fingerprint" => (results + recog_results).uniq.compact, 
          "error" => error_string, 
          "content" => [] 
        }
      end


      private 

      def grab_error_mysql(ip, port, timeout=30)
          
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

    end
  end
end
