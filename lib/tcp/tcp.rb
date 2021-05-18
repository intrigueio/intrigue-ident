module Intrigue
  module Ident
    module Tcp
      include Intrigue::Ident::SimpleSocket

      def generate_tcp_requests_and_check(ip, port, debug = false)

        results = []
        checks = []
        if Intrigue::Ident::Tcp::CheckFactory.checks != nil
          # generate the checks
          checks = Intrigue::Ident::Tcp::CheckFactory.checks.map {
            |x|
            x.new.generate_checks
          }.compact.flatten
        end
        
        checks.each do |check|
          # mak the request according to the type
          if check[:request_type] == :hex
            res = send_hex_request(ip, port, check[:request_content])
          elsif check[:request_type] == :plain
            res = send_plain_request(ip, port, check[:request_content])
          else
            raise "Unknown request type"
          end

          # match the response
          res = res.unpack("U*").map{|c|c.chr}.join
          if res =~ check[:match_content]
            # wee, we found something
            results << _construct_match_response(check, res)
          end
        end
        { "fingerprint" => results.uniq.compact, "banner" => "", "content" => [] }
      end

      private

      def send_hex_request(ip, port, data, timeout = 3)
        # TODO: do we need to do anything different to send in hex vs plain?
        send_plain_request(ip, port, data, timeout)
      end

      def send_plain_request(ip, port, data, timeout = 3)
        if socket = connect_tcp(ip, port, timeout)
          # first try to read something in case something comes back
          #puts "Attempting to read data first."
          out = "" 
          begin
            out =+ socket.readpartial(24576, timeout: timeout)
          rescue Errno::EHOSTUNREACH => e
            _logg "Error while reading! Host Unreachable."
            return
          rescue Errno::ECONNRESET => e
            _logg "Error while reading!"
          rescue Socketry::TimeoutError
            _logg "Error while reading! Timeout."
          end

          # now send our data
          _logg "Writing request data."
          socket.writepartial(data)

          #and read the response
          _logg "Reading response."
          begin
            out =+ socket.readpartial(24576, timeout: timeout)
          rescue Errno::EHOSTUNREACH => e
            _logg "Error while reading! Host Unreachable."
            return
          rescue Errno::ECONNRESET => e
            _logg "Error while reading!"
          rescue Socketry::TimeoutError
            _logg "Error while reading! Timeout."
          end
        else
          out = nil
        end

        "#{out}".encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
      end


      def _logg(msg, debug = false)
        if debug
          puts "DEBUG: #{msg}"
        end
      end
    end
  end
end
