module Intrigue
module Ident
module Check
    class Pantheon < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosted", "CMS"],
            :vendor => "Pantheon",
            :product => "Pantheon",
            :match_details => "x-pantheon-site header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-pantheon-site/,
            :paths => ["#{url}"]
          }

        ]
      end

    end
  end
  end
  end
