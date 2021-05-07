module Intrigue
  module Ident
    module Check
      class Lastpass < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Security SaaS],
              vendor: 'Lastpass',
              product: 'Lastpass',
              website: 'https://www.lastpass.com/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: LastPass$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
