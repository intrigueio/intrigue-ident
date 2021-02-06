module Intrigue
  module Ident
    module Check
      module Private
        class VijayMani < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Vijay Mani",
                :product => "Date",
                :website => "https://www.drupal.org/project/date",
                :match_details => "Vijay Mani Date - date.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/date_api\\\/|<link.*href=".*\/date_api\/)date.css/i,
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
