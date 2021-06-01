module Intrigue
  module Ident
    module Ip
      include Intrigue::Ident::SimpleSocket

      def generate_ip_requests_and_check(ip, port, debug = false)
        @debug = debug
        results = []
        checks = []
        if Intrigue::Ident::Ip::CheckFactory.checks != nil
          # generate the checks
          checks = Intrigue::Ident::Ip::CheckFactory.checks.map {
            |x|
            x.new.generate_checks
          }.compact.flatten
        end

        checks.each do |check|
          # mak the request according to the type
          if check[:request_type] == :hex
            res = send_hex_request(ip, port, check[:protocol], check[:request_content])
          elsif check[:request_type] == :plain
            res = send_plain_request(ip, port, check[:protocol], check[:request_content])
          else
            raise "Unknown request type"
          end

          # match the response
          if res =~ check[:match_content]
            # wee, we found something
            results << _construct_match_response(check, res)
          end
        end
        { "fingerprint" => results.uniq.compact, "banner" => "", "content" => [] }
      end

      private

      def send_hex_request(ip, port, protocol, data)
        # pack data in hex
        if data.is_a?(Array)
          data = data.pack("H*")
        else
          data = [].append(data).pack("H*")
        end

        # if data is not an array, try sending it anyway .
        res = send_request(ip, port, protocol, data)

        # unpack response and send pack
        return res.unpack("H*").join if res

      end

      def send_plain_request(ip, port, protocol, data)
        res = send_request(ip, port, protocol, data)
        res.encode("UTF-8", invalid: :replace, undef: :replace, replace: "?") if res
      end

      def send_request(ip, port, protocol, data, timeout = 3)
        case protocol
        when :tcp
          out = send_tcp_request(ip, port, data, timeout)
        when :udp
          out = send_udp_request(ip, port, data)
        else
          _logg "Unknown protocol specified"
          return ""
        end
        out
      end

      def send_udp_request(ip, port, data)
        out = ""
        socket = connect_udp(ip, port)
        if socket
          begin
            # now send our data
            _logg "Writing request data."
            socket.send(data)

            # and read the response
            _logg "Reading response."
            sout =  socket.recvfrom(24576)
            if sout && sout.message.is_a?(String)
              out += sout.message
            end
          rescue # probably not ideal but any kind of error will just fail to fingerprint :shrug:
            _logg "Something bad happened"
          end
        else
          out = nil
        end
        return out
      end

      def send_tcp_request(ip, port, data, timeout = 3)
        out = ""
        socket = connect_tcp(ip, port, timeout)
        if socket
          begin
            # send our data
            _logg "Writing request data."
            socket.writepartial(data)

            #and read the response
            _logg "Reading response."
            sout =  socket.readpartial(24576, timeout: timeout)
            if sout.is_a?(String)
              out += sout
            end
          rescue # probably not ideal but any kind of error will just fail to fingerprint :shrug:
            _logg "Something bad happened."
          end
        else
          out = nil
        end

        out
      end

      def _logg(msg)
        if @debug
          puts "DEBUG: #{msg}"
        end
      end
    end
  end
end
