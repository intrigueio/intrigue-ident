module Intrigue
  module Ident
    module Check
      module Private
        class TradeGecko < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "E-Commerce", "Management"],
                :vendor => "TradeGecko",
                :product => "TradeGecko",
                :website => "https://www.tradegecko.com/",
                :match_details => "TradeGecko - _tradegecko_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tradegecko_session=/,
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
