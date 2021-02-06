module Intrigue
  module Ident
    module Check
      module Private
        class VesaPalmu < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Vesa Palmu",
                :product => "AddThis",
                :website => "https://www.drupal.org/project/addthis",
                :match_details => "Vesa Palmu AddThis - addthis.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/addthis\\\/|<script.*src=".*\/addthis\/)addthis.js/i,
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
