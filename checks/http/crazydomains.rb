module Intrigue
  module Ident
  module Check
  class CrazyDomains < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "CrazyDomains",
          product: "CrazyDomains",
          website: "https://www.crazydomains.com.au/",
          references: [],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /Domain name is registered and secured with CrazyDomains.com.au/i,
            }
          ],
          description: "unique body string",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        }
      ]
    end
  
  end
  end
  end
  end
  