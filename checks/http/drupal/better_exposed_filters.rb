module Intrigue
  module Ident
    module Check
      module Private
        class BetterExposedFiltersProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Better Exposed Filters Project",
                :product => "Better Exposed Filters",
                :website => "https://www.drupal.org/project/better_exposed_filters",
                :match_details => "Better Exposed Filters Project Better Exposed Filters - better_exposed_filters.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/better_exposed_filters\\\/js\\\/|<script src=".*\/better_exposed_filters\/js\/)better_exposed_filters.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Better Exposed Filters Project",
                :product => "Better Exposed Filters",
                :website => "https://www.drupal.org/project/better_exposed_filters",
                :match_details => "Better Exposed Filters Project Better Exposed Filters - auto_submit.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/better_exposed_filters\\\/js\\\/|<script src=".*\/better_exposed_filters\/js\/)auto_submit.js/i,
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
