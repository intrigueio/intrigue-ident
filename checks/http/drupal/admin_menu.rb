module Intrigue
  module Ident
    module Check
      module Private
        class AdministrationMenuProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "Administration Menu Project",
                :product => "Administration Menu",
                :website => "https://www.drupal.org/project/admin_menu",
                :match_details => "Administration Menu Project Administration Menu - admin_devel.js Script Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/|<script.*src=".*\/)admin_devel.js/i,
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
