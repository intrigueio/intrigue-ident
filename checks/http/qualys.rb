module Intrigue
  module Ident
    module Check
      class Qualys < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Security'],
              vendor: 'Qualys',
              product: 'QualysGuard',
              website: 'https://www.qualys.com/qualysguard/',
              description: 'custom server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: Qualys$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Security'],
              vendor: 'Qualys',
              product: 'QualysGuard',
              website: 'https://www.qualys.com/qualysguard/',
              description: 'custom server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server: qweb/.*$}i,
                }
              ],
              dynamic_version: ->(x) { _first_header_capture(x, %r{^server: qweb/(.*)$}i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Security'],
              vendor: 'Qualys',
              product: 'Qualys Mobility',
              references: ['https://qualysguard.qualys.com/am/help/sensors/sem.htm'],
              description: 'custom server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: QMProprietary$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Security'],
              vendor: 'Qualys',
              product: 'Qualys Mobility',
              references: ['https://qualysguard.qualys.com/am/help/sensors/sem.htm'],
              description: 'custom server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /QualysSession=/i,
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
