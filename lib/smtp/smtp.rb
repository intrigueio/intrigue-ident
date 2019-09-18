module Intrigue
  module Ident
    module Smtp

      include Intrigue::Ident::SimpleSocket

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
