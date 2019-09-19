module Intrigue
module Ident
module Check
    class GoogleCloud < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Networking", "Load Balancer"],
            :vendor => "Google Cloud",
            :product =>"Load Balancewr",
            :match_details =>"cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content => /GCLB=/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
