module Intrigue
  module Ident
    module Check
      module Private
        class Cockpit < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["API", "Administrative"],
                :vendor => "Cockpit",
                :product => "Cockpit API",
                :website => "https://cockpit-project.org/",
                :match_details => "Cockpit API",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ Cockpit\ API$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["SSO", "Password Manager"],
                :vendor => "ManageEngine",
                :product => "ADSelfService Plus",
                :website => "https://www.manageengine.com/products/self-service-password/",
                :match_details => "ADSelfService Plus",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Adselfservice ?Plus$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["SSO", "Password Manager"],
                :vendor => "ManageEngine",
                :product => "ADSelfService Plus",
                :website => "https://www.manageengine.com/products/self-service-password/",
                :match_details => "ADSelfService Plus - Title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content => /^ManageEngine - ADSelfService Plus$/i,
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
