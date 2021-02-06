module Intrigue
  module Ident
    module Check
      module Private
        class Bulbee < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Bulbee",
                :product => "Bulbee",
                :website => "http://www.bulbee.net/",
                :match_details => "Bulbee Bulbee - bulbeelanding1_live_u2main Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bulbeelanding1_live_u2main=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://landing.bulbee.net/"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Bulbee",
                :product => "Bulbee",
                :website => "http://www.bulbee.net/",
                :match_details => "Bulbee Bulbee - bulbeelanding1_u1main Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bulbeelanding1_u1main=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://landing.bulbee.net/"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Bulbee",
                :product => "Bulbee",
                :website => "http://www.bulbee.net/",
                :match_details => "Bulbee Bulbee - bulbeelanding1_live_u2main.sig Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bulbeelanding1_live_u2main.sig=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://landing.bulbee.net/"],
              },
            ]
          end
        end
      end
    end
  end
end
