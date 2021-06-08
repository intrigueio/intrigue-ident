module Intrigue
  module Ident
  module Check
  class Bynder < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["CMS"],
          vendor: "Bynder",
          product: "Bynder",
          website: "https://www.bynder.com/en/",
          references: [],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_cookies,
              match_content: /bynder=/i,
            }
          ],
          description: "unique cookie",
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
  