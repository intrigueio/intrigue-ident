module Intrigue
  module Ident
    module Check
      class Lotus < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Administrative],
              vendor: 'Lotus',
              product: 'Domino',
              website: 'https://www.hcltechsw.com/wps/portal/products/domino',
              description: 'Lotus Domino',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Lotus-Domino/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Administrative],
              vendor: 'Lotus',
              product: 'Domino',
              website: 'https://www.hcltechsw.com/wps/portal/products/domino',
              description: 'Lotus Domino',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{homepage.nsf/homePage\.gif\?OpenImageResource}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Administrative],
              vendor: 'Lotus',
              product: 'Domino',
              website: 'https://www.hcltechsw.com/wps/portal/products/domino',
              description: 'Lotus Domino',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Notes Client/i,
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
