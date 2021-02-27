  module Intrigue
  module Ident
  module Check
  class Instra < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "Instra",
          product: "Instra",
          website: "https://www.instra.com/",
          version: nil,
          match_type: :content_title,
          match_content: /Domain\ parked\ by\ Instra/i,
          description: "Domain\ parked\ by\ Instra",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "Instra",
          product: "Instra",
          website: "https://www.instra.com/",
          references: ["https://www.europeregistry.com/about-us"],
          version: nil,
          match_type: :content_title,
          match_content: /\-\ Domain\ parked\ by\ Europe\ Registry/i,
          description: "\-\ Domain\ parked\ by\ Europe\ Registry",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "Instra",
          product: "Instra",
          website: "https://www.instra.com/",
          references: ["https://www.asiaregistry.com/about-us"],
          version: nil,
          match_type: :content_title,
          match_content: /\-\ Domain\ parked\ by\ Asia\ Registry/i,
          description: "\-\ Domain\ parked\ by\ Asia\ Registry",
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
