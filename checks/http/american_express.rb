module Intrigue
  module Ident
    module Check
      module Private
        class AmericanExpress < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "American Express",
                :product => "Meetings & Events",
                :website => "https://eventmobile.amexgbt.com/",
                :match_details => "American Express Meetings & Events - _event_mobile_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_event_mobile_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "American Express",
                :product => "Meetings & Events",
                :website => "https://meetingscentral.amexgbt.com/",
                :match_details => "American Express Meetings & Events - _eventsapp-dev_session= Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_eventsapp-dev_session=/i,
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
