module Intrigue
module Ident
module Check
    class Distil < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["CDN","WAF"],
            :vendor =>"Distil",
            :product =>"Distil",
            :match_details =>"unique header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-distil-cs/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
