module Intrigue
  module Ident
    module Check
      class Zendesk < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Support],
              vendor: 'Zendesk',
              product: 'Zendesk',
              description: 'unique header',
              references: [],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-zendesk-origin-server:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            { # TODO: - this might catch valid (closed) helpdesk uris too.
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Support],
              vendor: 'Zendesk',
              product: 'Zendesk',
              description: 'zendesk access by IP / invalid hostname',
              references: [],
              hide: true,
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<title>Help Center Closed \| Zendesk/i,
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
