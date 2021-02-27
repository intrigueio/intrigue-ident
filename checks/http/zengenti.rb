module Intrigue
  module Ident
    module Check
      class ContesisCMS < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "Zengenti",
              product: "Contensis CMS",
              references: ["https://zengenti.com/en-gb/products/contensis"],
              description: "Zengenti Contensis - generator page reference",
              version: nil,
              match_type: :content_body,
              match_content: /<meta name="generator" content="Contensis CMS/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Contensis CMS Version (\d+(\.\d+)*)/i)
              },
              hide: false,
              paths: [ { path: "#{url}", follow_redirects: true } ],
              inference: true,
            },
          ]
        end
      end
    end
  end
end
