module Intrigue
  module Ident
    module Check
      module Private
        class SimpleRisk < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management", "Security"],
                :vendor => "SimpleRisk",
                :product => "SimpleRisk",
                :website => "https://www.simplerisk.com/",
                :match_details => "SimpleRisk SimpleRisk  - SimpleRisk Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /SimpleRisk=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
