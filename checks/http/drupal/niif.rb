module Intrigue
  module Ident
    module Check
      module Private
        class Niif < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "niif",
                :product => "shibb auth",
                :website => "https://www.drupal.org/project/shib_auth",
                :match_details => "niif shibb auth - shib_auth.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/shib_auth\\\/|<link.*href=".*\/shib_auth\/)shib_auth.css/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
