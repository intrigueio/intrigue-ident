
require 'socketry'

module Intrigue
  module Ident
    module Socket

      # Connect to a given IP address and port.
      # @param ip [String]
      # @param port [Integer]
      # @return [TCPSocket, false]
      def connect_tcp(ip, port, timeout)
        begin
          Socketry::TCP::Socket.connect(ip.strip, port, local_addr: nil, local_port: nil, timeout: timeout)
        rescue Socketry::Resolver::Error
          puts "Error connecting! Unable to resolve."
          return nil
        rescue Socketry::TimeoutError
          puts "Error connecting! Timeout!"
          return nil
        end
      end

      # Connect to a given IP address and port.
      # @param ip [String]
      # @param port [Integer]
      # @return [UDPSocket, false]
      def connect_udp(ip, port)
        begin 
          Socketry::UDP::Socket.connect(ip.strip, port)
        rescue Socketry::Resolver::Error
          puts "Error connecting! Unable to resolve."
          return nil
        rescue Socketry::TimeoutError
          puts "Error connecting! Timeout."
          return nil
        end
      end

    end 
  end
end