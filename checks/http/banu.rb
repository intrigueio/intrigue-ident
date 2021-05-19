module Intrigue
  module Ident
    module Check
      class Banu < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'Proxy Server'],
              vendor: 'Banu',
              product: 'Tinyproxy',
              website: 'https://github.com/banu/tinyproxy',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: tinyproxy/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: tinyproxy/(.*)}i)
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
