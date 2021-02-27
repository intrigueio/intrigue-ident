module Intrigue
  module Ident
    module Check
      class Discuz < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "Discuz",
              product: "Discuzx",
              website: "http://www.discuz.net/",
              description: "Discuz - generator page reference",
              version: nil,
              match_type: :content_body,
              match_content: /<meta name="generator" content="Discuz!/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Discuz! x?(\d+(\.\d+)*)/i)
              },
              hide: false,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "Discuz",
              product: "Discuzx",
              website: "http://www.discuz.net/",
              description: "Discuz - powered by page reference",
              version: nil,
              match_type: :content_body,
              match_content: /Powered by <strong><a href="http:\/\/www.discuz\.net" target="_blank">Discuz!<\/a><\/strong> <em>/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /Powered by <strong><a href="http:\/\/www.discuz\.net" target="_blank">Discuz!<\/a><\/strong> <em>(\d+(\.\d+)*)/i)
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
