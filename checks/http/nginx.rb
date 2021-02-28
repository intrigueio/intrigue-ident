module Intrigue
  module Ident
    module Check
      class Nginx < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["WebServer"],
              vendor: "Nginx",
              product: "Nginx",
              description: "Nginx default page",
              version: nil,
              match_type: :content_title,
              match_content: /^Welcome to nginx\!?$/i,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["WebServer"],
              vendor: "Nginx",
              product: "Nginx",
              description: "Nginx test page",
              version: nil,
              match_type: :content_title,
              match_content: /^Test Page for the Nginx HTTP Server/i,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["WebServer"],
              vendor: "Nginx",
              product: "Nginx",
              description: "Nginx - server header",
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*nginx/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^server:.*nginx\/([\d\.]*).*/i)
              },
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["WebServer"],
              vendor: "Nginx",
              product: "Nginx",
              description: "nginx (default 404 page)",
              match_type: :content_body,
              match_content: /<hr><center>nginx<\/center>/i,
              hide: true,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
          ]
        end
      end
    end
  end
end
