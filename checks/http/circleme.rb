module Intrigue
  module Ident
    module Check
      module Private
        class Circleme < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social"],
                :vendor => "Circle.me",
                :product => "Circle.me",
                :website => "https://www.circle.me/",
                :match_details => "Circle.me - _cm_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_cm_session=/,
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
