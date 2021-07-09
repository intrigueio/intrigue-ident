module Intrigue
  module Ident
    module Check
      class Akamai < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CDN'],
              vendor: 'Akamai',
              product: 'Akamai',
              website: 'https://www.akamai.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: AkamaiGHost$/i,
                }
              ],
              description: 'ghost server header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CDN'],
              vendor: 'Akamai',
              product: 'Akamai',
              website: 'https://www.akamai.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /The requested URL "&#91;no&#32;URL&#93;", is invalid.<p>/,
                }
              ],
              description: 'Akamai Missing Uri',
              hide: true,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              vendor: 'Akamai',
              tags: ['CDN'],
              product: 'Akamai',
              website: 'https://www.akamai.com/',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-akamai-transformed:.*/,
                },
                {
                  match_type: :content_headers,
                  match_content: /X-Akamai-Staging: ESSL/,
                },
                {
                  match_type: :content_headers,
                  match_content: /X-Akamai-Staging: EdgeSuite/,
                },
              ],
              description: 'Akamai - Headers Match',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
