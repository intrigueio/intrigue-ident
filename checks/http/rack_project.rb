module Intrigue
  module Ident
    module Check
      class RackProject < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Rack Project',
              product: 'Rack',
              website: 'https://github.com/rack/rack',
              description: 'Rack - Headers Match',
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-rack-cache:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-cascade:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-runtime:.*$/i,
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
