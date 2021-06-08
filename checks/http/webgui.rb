module Intrigue
  module Ident
    module Check
      class WebGUI < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["CMS"],
              vendor: "WebGUI",
              product: "WebGUI",
              website: "https://www.webgui.org/",
              description: "WebGUI - generator tag page reference",
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="generator" content="WebGUI (\d+(\.\d+)*)"/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="WebGUI (\d+(\.\d+)*)"/i)
              },
              hide: false,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
          ]
        end
      end
    end
  end
end
