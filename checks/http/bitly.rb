module Intrigue
  module Ident
    module Check
      class Bitly < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing Hosting],
              vendor: 'Bitly',
              product: 'Bitly',
              website: 'https://bitly.com/',
              description: 'bitly cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /Domain=bitly.com;/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing Hosting],
              vendor: 'Bitly',
              product: 'Bitly',
              website: 'https://bitly.com/',
              description: 'bitly title - branded short domain',
              version: nil,
              hide: true, # dynamic hide only on ip access?
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Branded Short Domain Powered by Bitly/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Marketing Hosting],
              vendor: 'Bitly',
              product: 'Bitly',
              website: 'https://bitly.com/',
              description: 'bitly title - custom domain',
              version: nil,
              hide: true, # dynamic hide only on ip access?
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Custom Domain by Bitly/i,
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
