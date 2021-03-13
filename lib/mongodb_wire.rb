require "mongo"

module Intrigue
  module Ident
    module MongoDbWire
      include Mongo
      # Connect to a given IP address and port.
      # @param ip [String]
      # @param port [Integer]
      # @return [TCPSocket, false]
      def connect_to_mongo(ip, port, timeout)
        unless ip && port
          puts "Missing IP or Port! Refused."
          return nil
        end

        begin
          Mongo::Client.new(["#{ip}:#{port}"],
                            :retry_writes => false,
                            :connect_timeout => timeout)
          # :socket_timeout => timeout,
          # :server_selection_timeout => timeout)
        rescue Errno::ENETUNREACH => e
          puts "Error connecting! Refused."
          return nil
        rescue
          puts "Error connecting!"
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
