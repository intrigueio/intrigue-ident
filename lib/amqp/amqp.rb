module Intrigue
  module Ident
    module Amqp
      include Intrigue::Ident::SimpleSocket
      #To be improved - implement protocol to be able to extract more information
      def generate_amqp_request_and_check(ip, port = 5672, debug = false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        tcp_response = grab_tcp_response_amqp(ip, port)
        details = {
          "details" => {
            "tcp_response" => tcp_response,
          },
        }

        results = []

        # generate the checks
        checks = []
        if Intrigue::Ident::Amqp::CheckFactory.checks != nil
          checks = Intrigue::Ident::Amqp::CheckFactory.checks.map {
            |x|
            x.new.generate_checks
          }.compact.flatten
        end
        # and run them against our result
        checks.each do |check|
          results << match_amqp_response_hash(check, details)
        end

        { "fingerprint" => (results).uniq.compact, "tcp_response" => tcp_response, "content" => [] }
      end

      private

      def grab_tcp_response_amqp(ip, port, timeout = 30)
        if socket = connect_tcp(ip, port, timeout)
          socket.writepartial("test\r\n\r\n")
          begin
            out = socket.readpartial(24576, timeout: timeout)
          rescue Errno::EHOSTUNREACH => e
            puts "Error while reading! Reset."
            out = nil
          rescue Errno::ECONNRESET => e
            puts "Error while reading! Reset."
            out = nil
          rescue Socketry::TimeoutError
            puts "Error while reading! Timeout."
            out = nil
          end
        else
          out = nil
        end

        "#{out}".encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
      end
    end
  end
end
