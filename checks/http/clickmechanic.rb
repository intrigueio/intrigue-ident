module Intrigue
  module Ident
    module Check
      module Private
        class ClickMechanic < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "ClickMechanic",
                :product => "ClickMechanic",
                :website => "https://www.clickmechanic.com/",
                :match_details => "ClickMechanic - _clickmechanic_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_clickmechanic_session=/,
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
