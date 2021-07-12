module Intrigue
  module Ident
    module Check
      class Plesk < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS"],
              vendor: "Plesk",
              product: "Plesk",
              references: [],
              description: "Plesk - Headers Match",
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by: PleskLin/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^PleskWin/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by-plesk:.*/,
                }
              ],
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
          ]
        end
      end
    end
  end
end
