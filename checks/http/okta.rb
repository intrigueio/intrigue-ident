module Intrigue
  module Ident
    module Check
      class Okta < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['IAM', 'MFA', 'Security'],
              vendor: 'Okta',
              product: 'Okta',
              website: 'https://www.okta.com/',
              description: 'Okta - Headers Match',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-okta-backend/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /x-okta-request-id/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['IAM', 'MFA', 'Security'],
              vendor: 'Okta',
              product: 'Okta',
              website: 'https://www.okta.com/',
              description: 'okta container div',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /class="auth okta-container">/i,
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
