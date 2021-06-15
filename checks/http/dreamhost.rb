module Intrigue
  module Ident
  module Check
  class Dreamhost < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "Dreamhost",
          product: "Dreamhost",
          website: "https://www.dreamhost.com",
          references: [],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /This site is parked with DreamHost/i,
            }
          ],
          description: "parking string in body",
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
  