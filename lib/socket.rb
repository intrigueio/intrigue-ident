
require 'socketry'

module Intrigue
  module Ident
    module Socket

      # Connect to a given IP address and port.
      # @param ip [String]
      # @param port [Integer]
      # @return [TCPSocket, false]
      def connect_tcp(ip, port, timeout)
        puts "Making TCP Connection to #{ip} #{port}"
        Socketry::TCP::Socket.connect(ip, port, local_addr: nil, local_port: nil, timeout: timeout)
      end

      # Connect to a given IP address and port.
      # @param ip [String]
      # @param port [Integer]
      # @return [UDPSocket, false]
      def connect_udp(ip, port, timeout)
        puts "Making UDP Connection to #{ip} #{port}"
        Socketry::UDP::Socket.connect(ip, port, local_addr: nil, local_port: nil, timeout: timeout)
      end

    end 
  end
end