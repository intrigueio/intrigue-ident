module Intrigue
  module Ident
    module Check
      module Private
        class Canny < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management", "SaaS"],
                :vendor => "Canny",
                :product => "Canny",
                :website => "https://canny.io/",
                :match_details => "Canny - __canny__experimentID cookie",
                :match_type => :content_cookies,
                :match_content => /__canny__experimentID=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://api.cloudhelix.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management", "SaaS"],
                :vendor => "Canny",
                :product => "Canny",
                :website => "https://canny.io/",
                :match_details => "Canny - _gat_cannyTracker cookie",
                :match_type => :content_cookies,
                :match_content => /_gat_cannyTracker=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://api.cloudhelix.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
