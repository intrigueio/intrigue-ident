module Intrigue
  module Ident
    module Check
      module Private
        class Fokke < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Fokke",
                :product => "Video Filter",
                :website => "https://www.drupal.org/project/video_filter",
                :match_details => "Fokke Video Filter - video_filter.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/video_filter\\\/|<link.*href".*\/video_filter\/)video_filter.css/i,
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
