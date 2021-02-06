module Intrigue
  module Ident
    module Check
      module Private
        class SearchAPIAutocompleteProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Search API Autocomplete Project",
                :product => "Search API Autocomplete",
                :website => "https://www.drupal.org/project/geshifilter",
                :match_details => "Search API Autocomplete Project Search API Autocomplete - search_api_autocomplete.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/search_api_autocomplete\\\/|<link.*href=".*\/search_api_autocomplete\/)search_api_autocomplete.css/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Search API Autocomplete Project",
                :product => "Search API Autocomplete",
                :website => "https://www.drupal.org/project/geshifilter",
                :match_details => "Search API Autocomplete Project Search API Autocomplete - search_api_autocomplete.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/search_api_autocomplete\\\/|<script.*src=".*\/search_api_autocomplete\/)search_api_autocomplete.js/i,
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
