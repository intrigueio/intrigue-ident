module Intrigue
  module Ident
    module Check
      module Private
        class Airbnb < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Airbnb",
                :product => "Airbnb",
                :website => "http://airbnb.com/",
                :match_details => "Airbnb Airbnb - jitney_client_session_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /jitney_client_session_id=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Airbnb",
                :product => "Airbnb",
                :website => "http://airbnb.com/",
                :match_details => "Airbnb Airbnb - jitney_client_session_created_at Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /jitney_client_session_created_at=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hospitality"],
                :vendor => "Airbnb",
                :product => "Airbnb",
                :website => "http://airbnb.com/",
                :match_details => "Airbnb Airbnb - jitney_client_session_updated_at Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /jitney_client_session_updated_at=/,
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
