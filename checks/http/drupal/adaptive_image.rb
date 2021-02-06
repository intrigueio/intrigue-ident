module Intrigue
  module Ident
    module Check
      module Private
        class AdaptiveImageProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Adaptive Image Project",
                :product => "Adaptive Image",
                :website => "https://www.drupal.org/project/adaptive_image",
                :match_details => "Adaptive Image Project Adaptive Image - adaptive-image.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<link.*href=".*\/)adaptive-image.css/i,
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
