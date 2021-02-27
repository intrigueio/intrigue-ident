module Intrigue
  module Ident
    module Check
      class SubrionCMS < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "Subrion",
              product: "Subrion CMS",
              website: "https://subrion.org/",
              description: "Subrion - generator tag page reference",
              version: nil,
              match_type: :content_body,
              match_content: /<meta name="generator" content="Subrion CMS/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Subrion CMS (\d+(\.\d+)*)/i)
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
