module Intrigue
  module Ident
    module Check
      class Smartling < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            { # Magnolia CMS?
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS CMS],
              vendor: 'Smartling',
              product: 'Smartling',
              website: 'https://www.smartling.com/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-server: Smartling$/i,
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
