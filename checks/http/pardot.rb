module Intrigue
  module Ident
    module Check
      class Pardot < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing Javascript],
              vendor: 'Pardot',
              product: 'Pardot',
              website: 'https://www.pardot.com/',
              description: 'Pardot',
              version: nil,
              match_type: :content_cookies,
              match_content: /pardot/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing Javascript],
              vendor: 'Pardot',
              product: 'Pardot',
              website: 'https://www.pardot.com/',
              version: nil,
              description: 'Pardot - Server Header',
              match_type: :content_headers,
              match_content: /server: pardotserver/i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /server:.*pardotserver/i)
                               },
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
