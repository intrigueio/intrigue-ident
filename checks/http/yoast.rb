module Intrigue
  module Ident
    module Check
      class Yoast < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["Marketing", "Wordpress Plugin"],
              vendor: "Yoast",
              product: "Wordpress SEO",
              website: "https://yoast.com/wordpress/plugins/seo/",
              description: "Yoast - page reference.",
              match_type: :content_body,
              match_content: /<!-- This site is optimized with the Yoast SEO plugin/,
              version: nil,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<!-- This site is optimized with the Yoast SEO plugin v?(\d+(\.\d+)*)/)
              },
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
          ]
        end
      end
    end
  end
end
