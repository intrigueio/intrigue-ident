module Intrigue
  module Ident
    module Check
      class Imunify360 < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[WebServer ProxyServer],
              vendor: 'CloudLinux',
              product: 'Imunify360',
              references: ['https://www.imunify360.com/blog/webshield-introduction-for-server-administrators'],
              version: nil,
              description: 'CloudLinux Imunify360 - Server Header',
              match_type: :content_headers,
              match_content: /^server:\ imunify360-webshield/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^server:\ imunify360-webshield/(\d+(\.\d+)*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
