module Intrigue
  module Ident
    module Ftp

      include Intrigue::Ident::Socket

      def grab_banner_ftp(ip, port, timeout: 5)
          
        if socket = connect_tcp(ip, port, timeout)
          return socket.readpartial(2048, timeout: timeout)
        end

      nil
      end

    end
  end
end
