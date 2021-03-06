module Intrigue
  module Ident
    module Imap
      include Intrigue::Ident::SimpleSocket

      # gives us the recog Imap matchers
      include Intrigue::Ident::RecogWrapper::Imap

      def generate_imap_request_and_check(ip, port = 143, debug = false)

        # do the request (store as string and funky format bc of usage in core.. and  json conversions)
        banner_string = grab_banner_imap(ip, port)
        details = {
          "details" => {
            "banner" => banner_string,
          },
        }

        results = []

        # generate the checks
        checks = Intrigue::Ident::Imap::CheckFactory.checks.map { |x| x.new.generate_checks }.compact.flatten

        # and run them against our result
        checks.each do |check|
          results << match_imap_response_hash(check, details)
        end

        # Run recog across the banner
        recog_results = recog_match_imap_banner(banner_string)

        { "fingerprint" => (results + recog_results).uniq.compact, "banner" => banner_string, "content" => [] }
      end

      private

      def grab_banner_imap(ip, port, timeout = 30)
        if socket = connect_tcp(ip, port, timeout)
          #socket.writepartial("HELO friend.local\r\n\r\n")
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
