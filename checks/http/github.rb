module Intrigue
  module Ident
    module Check
      class Github < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'SaaS'],
              vendor: 'Github',
              product: 'Github',
              website: 'https://github.com/',
              description: 'Github - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-github-request-id:.*$/i
                },
                {
                  match_type: :content_headers,
                  match_content: /^server: GitHub.com$/i
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Login Panel'],
              vendor: 'Github',
              product: 'Enterprise',
              website: 'https://github.com/',
              description: 'Github Enterprise - Login panel page reference',
              version: nil,
              require_vendor: 'Github',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{GitHub Enterprise</title>}i
                },
                {
                  match_type: :content_body,
                  match_content: /password/i
                }
              ],
              paths: [
                { path: "#{url}/login", follow_redirects: true },
                { path: "#{url}/setup/unlock", follow_redirects: true }
              ],
              inference: false,
              test_target: ['https://1.221.184.114:8443/']
            }
          ]
        end
      end
    end
  end
end
