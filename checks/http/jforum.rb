module Intrigue
  module Ident
    module Check
      class Jforum < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'Jforum',
              product: 'Jforum',
              website: 'https://jforum.net/',
              description: 'cookie',
              version: '2.x',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /jforum-secure-sso=/i,
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
