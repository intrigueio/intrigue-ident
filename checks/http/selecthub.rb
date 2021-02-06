module Intrigue
  module Ident
    module Check
      module Private
        class SelectHub < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management", "PaaS"],
                :vendor => "SelectHub",
                :product => "SelectHub",
                :website => "https://www.selecthub.com/",
                :match_details => "SelectHub SelectHub - _selecthub_platform_key Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_selecthub_platform_key=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management", "PaaS"],
                :vendor => "SelectHub",
                :product => "SelectHub",
                :website => "https://www.selecthub.com/",
                :match_details => "SelectHub SelectHub - _vendor_portal_key Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_vendor_portal_key=/i,
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
