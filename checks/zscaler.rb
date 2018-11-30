module Intrigue
module Ident
module Check
    class Zscaler < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["WAF"],
            :vendor =>"Zscaler",
            :product =>"Zscaler",
            :match_details =>"server header for Zscaler",
            :references => ["https://help.zscaler.com/zia/about-private-zens"],
            :match_type => :content_headers,
            :match_content =>  /server: Zscaler/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/server: Zscaler\/(.*)/i)
            },
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
