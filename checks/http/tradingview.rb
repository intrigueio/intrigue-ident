module Intrigue
  module Ident
    module Check
      module Private
        class TradingView < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "TradingView",
                :product => "TradingView Web Server",
                :website => "http://www.tradingview.com/",
                :match_details => "TradingView TradingView Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: tv/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://en.tradingview.com:80"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Finance"],
                :vendor => "TradingView",
                :product => "TradingView",
                :website => "http://www.tradingview.com/",
                :match_details => "TradingView TradingView - tv_ecuid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tv_ecuid=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.tradingview.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
