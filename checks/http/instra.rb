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
          match_logic: :any,
          matches: [
            {
              match_type: :content_title,
              match_content: /Domain\ parked\ by\ Instra/i,
            },
            {
              match_type: :content_title,
              match_content: /\-\ Domain\ parked\ by\ Europe\ Registry/i,
            },
            {
              match_type: :content_title,
              match_content: /\-\ Domain\ parked\ by\ Asia\ Registry/i,
            }
          ],
          description: "Instra - Title Match",
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
