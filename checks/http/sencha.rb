module Intrigue
  module Ident
  module Check
  class Sencha < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["CMS"],
          vendor: "Sencha",
          product: "Cmd",
          references: ["https://www.sencha.com/products/sencha-cmd/"],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /<!-- The line below must be kept intact for Sencha Cmd to build your application -->/i,
            }
          ],
          description: "unique comment",
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
  