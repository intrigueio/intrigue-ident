module Intrigue
  module Ident
    module Smtp

      include Intrigue::Ident::Socket

      def grab_banner_smtp(ip, port, timeout=60)
          
        if socket = connect_tcp(ip, port, timeout)
          #socket.writepartial("HELO friend.local\r\n\r\n")
          return socket.readpartial(2048, timeout: timeout)
        end

      nil
      end

    end
  end
end
