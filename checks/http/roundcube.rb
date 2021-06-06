module Intrigue
  module Ident
    module Check
      class Roundcube < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Email COTS],
              vendor: 'Roundcube',
              product: 'Roundcube',
              website: 'https://roundcube.net/',
              description: 'Roundcube title',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /:: Welcome to Roundcube Webmail$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Email'],
              vendor: 'Roundcube',
              product: 'Roundcube',
              website: 'https://roundcube.net/',
              description: 'Roundcube session cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /roundcube_sessid=/i,
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
