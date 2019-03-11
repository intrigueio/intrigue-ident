module Intrigue
module Ident
module Check
    class Sonicwall < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Networking","VPN"],
            :vendor =>"Sonicwall",
            :product =>"SonicOS",
            :match_details =>"server header",
            :references => [
              "https://www.sonicwall.com/en-us/support/technical-documentation/secure-mobile-access-12-0-workplace-user-guide/using-sma-workplace"],
            :match_type => :content_headers,
            :match_content =>  /server: SMA\/.*/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/server: SMA\/(.*)/i)
            },
            :paths => ["#{url}"],
            :examples => ["server: SMA/12.2"],
            :inference => true
          },
          { # duplicate of SMA fingerprint, want to flag SonicOS as well
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS","Networking","VPN"],
            :vendor =>"Sonicwall",
            :product =>"Secure Mobile Access",
            :match_details =>"server header",
            :references => [
              "https://www.sonicwall.com/en-us/support/technical-documentation/secure-mobile-access-12-0-workplace-user-guide/using-sma-workplace"],
            :match_type => :content_headers,
            :match_content =>  /server: SMA\/.*/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/server: SMA\/(.*)/i)
            },
            :paths => ["#{url}"],
            :examples => ["server: SMA/12.2"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
