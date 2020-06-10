module Intrigue
  module Ident
    module Smtp

      include Intrigue::Ident::SimpleSocket

      # gives us the recog smtp matchers 
      include Intrigue::Ident::RecogWrapper::Smtp

      def generate_smtp_request_and_check(ip, port=25, debug=false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_smtp(ip,port)
        details = {
          "details" => {
            "banner" => banner_string
          }
        }
  
        results = []
  
        # generate the checks 
        checks = Intrigue::Ident::Smtp::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten
  
        # and run them against our result
        checks.each do |check|
          results << match_smtp_response_hash(check,details)
        end
  
        # Run recog across the banner
        short_banner_string = banner_string.split(" ")[2..-1].join(" ") # skip 220 and hostname
        recog_results = recog_match_smtp_banner(short_banner_string)
  
      { "fingerprint" => (results + recog_results).uniq.compact, "banner" => banner_string, "content" => [] }
      end

      private

      def grab_banner_smtp(ip, port, timeout=60)
          
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
