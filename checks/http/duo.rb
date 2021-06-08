module Intrigue
  module Ident
  module Check
  class Duo < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["COTS", "Security", "IAM"],
          vendor: "Duo",
          product: "Access Gateway",
          references: ["https://duo.com/docs/dag"],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_cookies,
              match_content: /DUO_ACCESS_GATEWAY_AFFINITY/i,
            }
          ],
          description: "affinity cookie",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "application",
          tags: ["COTS", "Security", "IAM"],
          vendor: "Duo",
          product: "Access Gateway",
          references: ["https://duo.com/docs/dag"],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_title,
              match_content: /^Duo Access Gateway$/i,
            }
          ],
          description: "title",
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
  