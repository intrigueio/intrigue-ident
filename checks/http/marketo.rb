module Intrigue
  module Ident
    module Check
      class Marketo < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing CRM],
              vendor: 'Marketo',
              product: 'Marketo',
              website: 'https://marketo.com/',
              description: 'Marketo - Login Title Page Reference',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Login \| Marketo$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing CRM],
              vendor: 'Marketo',
              product: 'Marketo',
              website: 'https://marketo.com/',
              description: 'Marketo - Location Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^Location:.*\.marketo\.com/index\.php$}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: false }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
