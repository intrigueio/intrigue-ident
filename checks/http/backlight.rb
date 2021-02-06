module Intrigue
  module Ident
    module Check
      module Private
        class Backlight < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Backlight",
                :product => "Backlight",
                :website => "https://backlight.me/",
                :match_details => "Backlight - _blacklight_session cookie",
                :match_type => :content_cookies,
                :match_content => /_blacklight_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://resource.nlm.nih.gov:80"],
              },
            ]
          end
        end
      end
    end
  end
end
