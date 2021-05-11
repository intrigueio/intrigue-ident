module Intrigue
  module Ident
    module Check
      class Readmeio < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[JavaScript SaaS Support],
              vendor: 'Readme.io',
              product: 'Readme.io',
              website: 'https://readme.com/',
              description: 'js load string',
              version: nil,
              match_type: :content_body,
              match_content: %r{cdn.readme.io/js/bundle-hub2.js}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS API],
              vendor: 'Readme.io',
              product: 'Readme.io',
              website: 'https://readme.com/',
              description: 'readme.io api manager',
              version: nil,
              match_type: :content_body,
              match_content: /\.hub-api \.api-definition/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS API],
              vendor: 'Readme.io',
              product: 'Readme.io',
              website: 'https://readme.com/',
              description: 'readme.io string',
              version: nil,
              match_type: :content_body,
              match_content: /id="hub-me"/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }

          ]
        end
      end
    end
  end
end
