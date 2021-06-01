module Intrigue
  module Ident
    module Check
      class Magento < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Payments],
              vendor: 'Magento',
              product: 'Magento',
              website: 'https://magento.com/',
              description: 'cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Mage.Cookies.path/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Payments],
              vendor: 'Magento',
              product: 'Magento',
              website: 'https://magento.com/',
              description: 'Magento - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-magento-cache-debug:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-magento-cache-control:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-magento-tags:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            { # also... /skin/frontend/default/default/css/styles.css
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Payments],
              vendor: 'Magento',
              product: 'Magento',
              website: 'https://magento.com/',
              description: 'cookies js file',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /old school cookie functions grabbed off the web/i,
                }
              ],
              paths: [{ path: "#{url}/js/mage/cookies.js", follow_redirects: true }],
              require_product: 'Magento',
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Payments],
              vendor: 'Magento',
              product: 'Magento',
              website: 'https://magento.com/',
              description: 'release notes file',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /==== [\d.]+ ====/i,
                }
              ],
              dynamic_version: ->(x) { _first_body_capture(x, /==== ([\d.]+) ====/i) },
              paths: [{ path: "#{url}/RELEASE_NOTES.txt", follow_redirects: true }],
              require_product: 'Magento',
              inference: false
            }
          ]
        end
      end
    end
  end
end
