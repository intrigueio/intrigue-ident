module Intrigue
  module Ident
  module Check
  class AfterMarketPl < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "AfterMarketPL",
          product: "AfterMarketPL",
          website: "https://www.aftermarket.pl/",
          references: [],
          version: nil,
          match_logic: :any,
          matches: [
            {
              match_type: :content_body,
              match_content: /<\/strong> has been registered on <strong>/i,
            },
            {
              match_type: :content_title,
              match_content: /AfterMarket\.pl :: domain /i,
            }
          ],
          description: "AfterMarketPL - Page Reference",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
      ]
    end
  
  end
  end
  end
  end
