module Intrigue
  module Ident
  module Check
  class DomainNameShop < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "DomainNameShop",
          product: "DomainNameShop",
          website: "https://domainname.shop/",
          references: [],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /is\ registered,\ but\ the\ owner\ currently\ does\ not\ have\ an\ active\ website\ here\./i,
            }
          ],
          description: "is\ registered,\ but\ the\ owner\ currently\ does\ not\ have\ an\ active\ website\ here\.",
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
