module Intrigue
  module Ident
    module Check
      class Tridium < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Administrative Networking],
              vendor: 'Tridium',
              product: 'Niagara',
              website: 'https://www.tridium.com/us/en',
              description: 'cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /niagara_session=/i,
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
