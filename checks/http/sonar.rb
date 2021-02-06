module Intrigue
  module Ident
    module Check
      module Private
        class Sonar < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Cloud", "CRM"],
                :vendor => "Sonar",
                :product => "Sonar",
                :website => "https://sonar.software/",
                :match_details => "Sonar Sonar - sonar_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sonar_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://162.243.97.178:80"],
              },
            ]
          end
        end
      end
    end
  end
end
