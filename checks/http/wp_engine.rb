module Intrigue
module Ident
module Check
    class WpEngine < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosted", "CMS"],
            :vendor =>"WPEngine",
            :product =>"WPEngine",
            :match_details =>"WPEngine - Access site by IP",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /This domain is successfully pointed at WP Engine, but is not configured for an account on our platform./,
            :hide => true,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosted", "CMS"],
            :vendor =>"WPEngine",
            :product =>"WPEngine",
            :match_details =>"WPEngine header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^wpe-backend:/, # note that this will tell us the server ala,,,   "wpe-backend: apache",
            :hide => true,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
end
end
end
