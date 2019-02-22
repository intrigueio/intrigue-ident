module Intrigue
module Ident
module Check
    class Nimble < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Media Streaming"],
            :vendor =>"WMSPanel",
            :product =>"Nimble Streamer",
            :match_details =>"server header",
            :references => [
              "https://wmspanel.com/nimble/",
              "https://en.wikipedia.org/wiki/Nimble_Streamer"
            ],
            :match_type => :content_headers,
            :match_content =>  /^server: nimble.*$/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/^server: nimble\/(.*)$/i)
            },
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
