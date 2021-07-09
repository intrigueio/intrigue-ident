module Intrigue
  module Ident
    module Check
      class Dynatrace < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Analytics APM JavaScript],
              vendor: 'Dynatrace',
              product: 'Dynatrace',
              description: 'Dynatrace - Headers Match',
              website: "http://dynatrace.com/",
              references: ['http://ruxit.com'],
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-ruxit-js-agent:.*/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-dynatrace-js-agent:.*/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /X-OneAgent-JS-Injection:/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
