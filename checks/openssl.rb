module Intrigue
module Ident
module Check
    class Openssl < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Library"],
            :vendor =>"OpenSSL",
            :product =>"OpenSSL",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^.*OpenSSL\/.*$/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/^.*OpenSSL\/([\w\d\.\-]*)\s.*$/i)
            },
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
