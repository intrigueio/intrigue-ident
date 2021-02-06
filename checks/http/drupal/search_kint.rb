module Intrigue
  module Ident
    module Check
      module Private
        class SearchKintProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Search Kint Project",
                :product => "Search Kint",
                :website => "https://www.drupal.org/project/search_kint",
                :match_details => "Search Kint Project Search Kint - search_kint.search.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script.*src=".*\/)search_kint.search.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Search Kint Project",
                :product => "Search Kint",
                :website => "https://www.drupal.org/project/search_kint",
                :match_details => "Search Kint Project Search Kint - search_kint.trail.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script.*src=".*\/)search_kint.trail.js/i,
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
