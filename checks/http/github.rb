module Intrigue
  module Ident
    module Check
      class Github < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development SaaS],
              vendor: 'Github',
              product: 'Github',
              website: 'https://github.com/',
              description: 'github specific header',
              version: nil,
              match_type: :content_headers,
              match_content: /^x-github-request-id:.*$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development SaaS],
              vendor: 'Github',
              product: 'Github',
              website: 'https://github.com/',
              description: 'github server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: GitHub.com$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
