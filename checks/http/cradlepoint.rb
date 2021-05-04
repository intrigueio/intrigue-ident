module Intrigue
  module Ident
    module Check
      class Cradlepoint < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Cradlepoint',
              product: 'HTTP Service',
              website: 'https://cradlepoint.com/',
              references: ['https://cradlepoint.com/vulnerability-alerts/'],
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*Cerberus.*$/,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^server:.*Cerberus/([\d.]*)\s.*$}i)
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
