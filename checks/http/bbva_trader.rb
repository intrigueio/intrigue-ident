module Intrigue
  module Ident
    module Check
      module Private
        class BBVATrader < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Finance", "SaaS"],
                :vendor => "BBVA Trader",
                :product => "BBVA Trader",
                :website => "https://www.bbvatrader.com/",
                :match_details => "BBVA Trader BBVA Trader - bbvabol Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bbvabol=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Finance", "SaaS"],
                :vendor => "BBVA Trader",
                :product => "BBVA Trader",
                :website => "https://www.bbvatrader.com/",
                :match_details => "BBVA Trader BBVA Trader - akacd_bbvaassetmanagement_label Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /akacd_bbvaassetmanagement_label=/i,
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
