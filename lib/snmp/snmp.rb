module Intrigue
  module Ident
    module Snmp

      include Intrigue::Ident::Socket

      def grab_banner_snmp(ip, port, timeout: 5)
          
        if socket = connect_udp(ip, port, timeout)
          return socket.readpartial(1024, timeout: timeout)
        end

      nil
      end

    end
  end
end
