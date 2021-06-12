module Intrigue
  module Ident
    module Check
      class Day < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Web Server', 'CMS'],
              vendor: 'DAY',
              product: 'Communique',
              references: ['https://en.wikipedia.org/wiki/Day_Software'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^Server: Apache.*Communique/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^Server: Apache.*Communique/(\d\.+)}i)
              },
              description: 'Apache module from server header',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
