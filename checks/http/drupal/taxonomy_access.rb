module Intrigue
  module Ident
    module Check
      module Private
        class TaxonomyAccessControlProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Taxonomy Access Control Project",
                :product => "Taxonomy Access Control",
                :website => "https://www.drupal.org/project/taxonomy_access",
                :match_details => "Taxonomy Access Control Project Taxonomy Access Control - taxonomy_access.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/taxonomy_access\\\/|<link.*href=".*\/taxonomy_access\/)taxonomy_access.css/i,
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
