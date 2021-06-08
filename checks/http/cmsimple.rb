module Intrigue
  module Ident
    module Check
      class CMSimple < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "CMSimple",
              product: "CMSimple",
              references: ["https://www.cmsimple.fr/"],
              description: "CMSimple - generator page reference",
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="generator" content="CMSimple/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="CMSimple (\d+(\.\d+)*)/i)
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
