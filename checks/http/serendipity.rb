module Intrigue
  module Ident
    module Check
      class Serendipity < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "s9y",
              product: "Serendipity",
              references: ["https://docs.s9y.org/"],
              description: "Serendipity - generator tag page reference",
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="generator" content="Serendipity/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Serendipity v.(\d+(\.\d+)*)/i)
              },
              hide: false,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
          ]
        end
      end
    end
  end
end
