module Intrigue
  module Ident
    module Check
      module Private
        class KonamiCodeProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Konami Code Project",
                :product => "Konami Code",
                :website => "https://www.drupal.org/project/konamicode",
                :match_details => "Konami Code Project Konami Code - konamicode.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/konamicode\\\/|<script.*src=".*\/konamicode\/)konamicode.js/i,
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
