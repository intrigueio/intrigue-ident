module Intrigue
module Ident
module Check
    class Incapsula < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting","CDN","WAF"],
            :vendor =>"Incapsula",
            :product =>"CDN",
            :match_details =>"incapsula header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-iinfo:\ .*$/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
