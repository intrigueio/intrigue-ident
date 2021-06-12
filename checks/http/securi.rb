module Intrigue
  module Ident
    module Check
      class Sucuri < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[SaaS WAF Security],
              vendor: 'Sucuri',
              product: 'Cloudproxy',
              website: 'https://sucuri.net/website-firewall/',
              description: 'Sucuri Cloudproxy - Server Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{Server: Sucuri/Cloudproxy}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[SaaS WAF Security],
              vendor: 'Sucuri',
              product: 'Cloudproxy',
              website: 'https://sucuri.net/website-firewall/',
              description: 'Sucuri Cloudproxy - X-Sucuri-ID Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-Sucuri-ID:.*/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[SaaS WAF Security],
              vendor: 'Sucuri',
              product: 'Cloudproxy',
              website: 'https://sucuri.net/website-firewall/',
              description: 'Sucuri Cloudproxy - X-Sucuri-Cache Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^X-Sucuri-Cache:.*/i,
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
