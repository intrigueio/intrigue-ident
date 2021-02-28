module Intrigue
  module Ident
  module Check
  class EpicCom < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "EpicCom",
          product: "EpicCom",
          website: "https://www.epik.com/",
          references: [],
          version: nil,
          match_type: :content_body,
          match_content: /Why\ purchase\ this\ domain\ with\ Epik/i,
          description: "Why\ purchase\ this\ domain\ with\ Epik",
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
  
