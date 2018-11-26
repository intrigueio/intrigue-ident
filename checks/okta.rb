module Intrigue
module Ident
module Check
    class Okta < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "service",
            :vendor =>"Okta",
            :product =>"Okta",
            :match_details =>"okta auth",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-okta-backend/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
