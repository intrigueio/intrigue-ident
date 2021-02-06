module Intrigue
  module Ident
    module Check
      module Private
        class JoeWheaton < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Joe Wheaton",
                :product => "Colorbox",
                :website => "https://www.drupal.org/project/colorbox",
                :match_details => "Joe Wheaton Colorbox - colorbox.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/colorbox\\\/js\\\/|<script.*src=".*\/colorbox\/js\/)colorbox.js/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Joe Wheaton",
                :product => "Colorbox",
                :website => "https://www.drupal.org/project/colorbox",
                :match_details => "Joe Wheaton Colorbox - colorbox_style.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :require_product => "Drupal",
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/colorbox\\\/styles\\\/stockholmsyndrome\\\/|<script.*src=".*\/colorbox\/styles\/stockholmsyndrome\/)colorbox_style.js/i,
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
