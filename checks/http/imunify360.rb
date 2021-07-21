module Intrigue
  module Ident
    module Check
      class Imunify360 < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Security', 'Web Server', 'WAF', 'Management', 'Hosting'],
              vendor: 'Imunify360',
              product: 'Imunify360',
              references: ['https://www.imunify360.com/blog/webshield-introduction-for-server-administrators'],
              version: nil,
              description: 'Imunify360 Imunify360 - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server:\ imunify360-webshield/i,
                }
              ],
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
