module Intrigue
module Ident
module Check
    class Lotus < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS", "Administrative"],
            :vendor => "Lotus",
            :product =>"Domino",
            :match_details =>"Lotus Domino",
            :match_type => :content_headers,
            :version => nil,
            :match_content =>  /server: Lotus-Domino/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
