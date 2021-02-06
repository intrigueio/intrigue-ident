module Intrigue
  module Ident
    module Check
      module Private
        class Chartboost < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Marketing", "SaaS"],
                :vendor => "Chartboost",
                :product => "Chartboost",
                :website => "https://www.chartboost.com/",
                :match_details => "Chartboost Chartboost - X-Lb-Backend Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Lb-Backend: dashboard-backend/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://www.dashboard.chartboost.com:80"],
              },
            ]
          end
        end
      end
    end
  end
end
