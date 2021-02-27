module Intrigue
  module Ident
  module Check
  class Proofpoint < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["COTS", "Security"],
          vendor: "Proofpoint",
          product: "Protection Server",
          references: ["https://www.proofpoint.com/us/resources/data-sheets/protection-server-technical-brief"],
          version: nil,
          match_type: :content_title,
          match_content: /^Proofpoint Protection Server$/i,
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
  