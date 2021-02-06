module Intrigue
  module Ident
    module Check
      module Private
        class TravelTripper < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Development", "Marketing", "E-Commerce", "SaaS"],
                :vendor => "Travel Tripper",
                :product => "Travel Tripper",
                :website => "http://www.traveltripper.com/",
                :match_details => "Travel Tripper Travel Tripper - _travel_tripper_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_travel_tripper_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://reserve.venetian.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
