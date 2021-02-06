module Intrigue
  module Ident
    module Check
      module Private
        class UserAlertProject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Drupal Plugin"],
                :vendor => "User Alert Project",
                :product => "User Alert",
                :website => "https://www.drupal.org/project/user_alert",
                :match_details => "User Alert Project User Alert - user-alert.css Link Page Reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /(jquery\.extend\(drupal\.settings.*\\\/user_alert\\\/css\\\/|<link.*href=".*\/user_alert\/css\/)user-alert.css/i,
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
