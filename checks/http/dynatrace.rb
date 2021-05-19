module Intrigue
  module Ident
    module Check
      class Dynatrace < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[APM JavaScript],
              vendor: 'Dynatrace',
              product: 'Dynatrace',
              description: 'x-ruxit-js-agent header',
              references: ['http://ruxit.com'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-ruxit-js-agent:.*/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[APM JavaScript],
              vendor: 'Dynatrace',
              product: 'Dynatrace',
              description: 'x-dynatrace-js-agent header',
              references: ['http://ruxit.com'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-ruxit-js-agent:.*/i,
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
