module Intrigue
  module Ident
    module Check
      class Fastly < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting CDN WAF],
              vendor: 'Fastly',
              product: 'Fastly',
              website: 'https://www.fastly.com/',
              description: 'Fastly - x-fastly-backend-reqs header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-fastly-backend-reqs:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting CDN WAF],
              vendor: 'Fastly',
              product: 'Fastly',
              website: 'https://www.fastly.com/',
              description: 'Fastly - x-fastly-service header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-fastly-service:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting CDN WAF],
              vendor: 'Fastly',
              product: 'Fastly',
              website: 'https://www.fastly.com/',
              description: 'Fastly - x-fastly-request-id header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-fastly-request-id:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting CDN WAF],
              vendor: 'Fastly',
              product: 'Fastly',
              website: 'https://www.fastly.com/',
              description: 'error content in page',
              version: nil,
              hide: true,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Fastly error: unknown domain/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
