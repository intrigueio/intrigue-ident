module Intrigue
  module Ident
    module Check
      class Jekyll < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "service",
              tags: ["CMS"],
              vendor: "jekyllrb",
              product: "Jekyll",
              references: ["https://jekyllrb.com/"],
              description: "jekyllrb - generator tag page reference",
              version: nil,
              match_type: :content_body,
              match_content: /<meta name="generator" content="Jekyll/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Jekyll v(\d+(\.\d+)*)/i)
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
