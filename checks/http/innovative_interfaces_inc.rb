module Intrigue
  module Ident
    module Check
      class InnovativeInterfacesInc < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CMS'],
              vendor: 'Innovative Interfaces Inc',
              product: 'III 100',
              website: 'https://www.iii.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: III 100/,
                }
              ],
              description: 'server header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
