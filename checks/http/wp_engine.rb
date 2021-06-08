module Intrigue
  module Ident
    module Check
      class WpEngine < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CMS SaaS],
              vendor: 'WPEngine',
              product: 'WPEngine',
              website: 'https://wpengine.co.uk/',
              description: 'WPEngine - Access site by IP',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /This domain is successfully pointed at WP Engine, but is not configured for an account on our platform./,
                }
              ],
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CMS SaaS],
              vendor: 'WPEngine',
              product: 'WPEngine',
              website: 'https://wpengine.co.uk/',
              description: 'WPEngine header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by: WP Engine$/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CMS SaaS],
              vendor: 'WPEngine',
              product: 'WPEngine',
              website: 'https://wpengine.co.uk/',
              description: 'WPEngine header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  # TODO: note that this will tell us the server ala,,,   "wpe-backend: apache",
                  match_content: /^wpe-backend:/,
                }
              ],
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
