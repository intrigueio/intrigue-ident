module Intrigue
  module Ident
  module Check
  class Kong < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["API"],
          vendor: "Kong",
          product:"Kong",
          description:"server header",
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_headers,
              match_content: /^server: kong\/[\d\.]+/i,
            }
          ],
          references: [],
          dynamic_version: lambda { |x|
            _first_header_capture(x,/^server: kong\/([\d\.]+)/i)
          },
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: true
        },
        #
        {
          type: "fingerprint",
          category: "application",
          tags: ["API"],
          vendor: "Kong",
          product:"Kong",
          description:"no match body",
          match_type: :content_body,
          version: nil,
          references: [],
          match_content: /^\{\"message\"\:\"no Route matched with those values\"\}/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: true
        },

      ]
    end

  end
  end
  end
  end
