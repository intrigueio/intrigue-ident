module Intrigue
module Ident
module Check
    class Ruby < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Server"],
            :vendor =>"Ruby",
            :product =>"Rack",
            :match_details =>"x-rack-cache header",
            :match_type => :content_headers,
            :match_content =>  /^x-rack-cache:.*$/i,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["library"],
            :vendor =>"Ruby",
            :product =>"Ruby",
            :match_details =>"x-rack-cache header",
            :match_type => :content_headers,
            :match_content =>  /^x-rack-cache:.*$/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
