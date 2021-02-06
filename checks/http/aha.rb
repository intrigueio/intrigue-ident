module Intrigue
  module Ident
    module Check
      module Private
        class Aha < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Marketing", "Management", "SaaS"],
                :vendor => "Aha",
                :product => "Aha",
                :website => "https://www.aha.io/",
                :match_details => "Aha Aha - _aha_t Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_aha_t=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Marketing", "Management", "SaaS"],
                :vendor => "Aha",
                :product => "Aha",
                :website => "https://www.aha.io/",
                :match_details => "Aha Aha - _aha_app_2 Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_aha_app_2=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
