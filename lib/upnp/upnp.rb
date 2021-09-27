module Intrigue
  module Ident
    module Upnp
      include Intrigue::Ident::SimpleSocket

      # gives us the recog upnp matchers
      #include Intrigue::Ident::RecogWrapper::Upnp

      def generate_upnp_request_and_check(ip, port = 1900, debug = false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_upnp(ip, port)
        details = {
          "details" => {
            "banner" => banner_string,
          },
        }

        results = []
        checks = []
        if Intrigue::Ident::Upnp::CheckFactory.checks != nil
          # generate the checks
          checks = Intrigue::Ident::Upnp::CheckFactory.checks.map {
            |x|
            x.new.generate_checks
          }.compact.flatten
        end
        # and run them against our result
        checks.each do |check|
          results << match_upnp_response_hash(check, details)
        end

        # Run recog across the banner
        #recog_results = recog_match_upnp_banner(banner_string)
        recog_results = []

        { "fingerprint" => (results + recog_results).uniq.compact, "banner" => banner_string, "content" => [] }
      end

      private

      def pkt1
        "M-SEARCH * HTTP/1.1\r\nHost: 239.255.255.250:1900\r\nMan: \"ssdp:discover\"\r\nMX: 5\r\nST: ssdp:all\r\n\r\n"
      end

      def pkt2
        "M-SEARCH * HTTP/1.1\r\nHost:239.255.255.250:1900\r\nST:upnp:rootdevice\r\nMan:\"ssdp:discover\"\r\nMX:3\r\n\r\n"
      end

      def grab_banner_upnp(ip, port, timeout = 30)
        if socket = connect_udp(ip, port)
          begin

            socket.send pkt1
            socket.send pkt1
            socket.send pkt2
            datagram = socket.recvfrom(4096)

            socket.close
          rescue Errno::EHOSTUNREACH => e
            puts "Error while reading! Host Unreachable."
            datagram = nil
          rescue Errno::ECONNRESET => e
            puts "Error while reading! Reset."
            datagram = nil
          rescue Socketry::TimeoutError
            puts "Error while reading! Timeout."
          end
        else
          datagram = nil
        end

        # if we got a response, pull the message
        return "#{datagram.message}".encode("UTF-8", invalid: :replace, undef: :replace, replace: "?") if datagram

      nil
      end
    end
  end
end
