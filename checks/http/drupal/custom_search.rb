module Intrigue
  module Ident
    module Check
      module Private
        class CustomSearchProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Custom Search Project",
                :product => "Custom Search",
                :website => "https://www.drupal.org/project/custom_search",
                :match_details => "Custom Search Project Custom Search - custom_search.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/custom_search\\\/js\\\/|<script.*src=".*\/custom_search\/js\/)custom_search.js/i,
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
