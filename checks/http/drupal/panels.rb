module Intrigue
  module Ident
    module Check
      module Private
        class PanelsProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Panels Project",
                :product => "Panels",
                :website => "https://www.drupal.org/project/panels",
                :match_details => "Panels Project Panels - panels.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/panels\\\/css\\\/|<link.*href=".*\/panels\/css\/)panels.css/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Panels Project",
                :product => "Panels",
                :website => "https://www.drupal.org/project/panels",
                :match_details => "Panels Project Panels - onecol.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(\\\/|\/)panels(\\\/|\/)plugins(\\\/|\/)layouts(\\\/|\/)onecol(\\\/|\/)onecol.css/i,
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
