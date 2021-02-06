module Intrigue
  module Ident
    module Check
      module Private
        class KevinMontgomery < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Kevin Montgomery",
                :product => "Caption Filter",
                :website => "https://www.drupal.org/project/caption_filter",
                :match_details => "Kevin Montgomery Caption Filter - caption-filter.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/caption_filter\\\/js\\\/|<script.*src=".*\/caption_filter\/js\/)caption-filter.js/i,
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
