module Intrigue
  module Ident
    module Check
      module Private
        class Acturis < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Acturis",
                :product => "Acturis",
                :website => "https://www.acturis.com/",
                :match_details => "Acturis - Acturis.ASPXANONYMOUS Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /Acturis.ASPXANONYMOUS=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Acturis",
                :product => "Acturis",
                :website => "https://www.acturis.com/",
                :match_details => "Acturis - Acturis.ASPXSESSION Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /Acturis.ASPXSESSION=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Acturis",
                :product => "Acturis",
                :website => "https://www.acturis.com/",
                :match_details => "Acturis - K-Acturis.ASPXSESSION Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /K-Acturis.ASPXSESSION-\w*=/,
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
