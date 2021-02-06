module Intrigue
  module Ident
    module Check
      module Private
        class Safeco < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Safeco Insurance",
                :product => "Safeco Insurance",
                :website => "https://www.safeco.com/",
                :match_details => "Safeco Insurance Safeco Insurance - akaas_Safeco_Insurance_Agent Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /akaas_Safeco_Insurance_Agent=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://insurance-agent.safeco.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
