module Intrigue
  module Ident
    module Check
      module Private
        class FancyboxProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Fancybox Project",
                :product => "Fancybox",
                :website => "https://www.drupal.org/project/fancybox",
                :match_details => "Fancybox Project Fancybox - fancybox.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/fancybox\\\/|<script.*src=".*\/fancybox\/)fancybox.js/i,
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
