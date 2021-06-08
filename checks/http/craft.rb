module Intrigue
  module Ident
    module Check
      class Craft < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CMS'],
              vendor: 'Craft',
              product: 'CMS',
              website: 'https://craftcms.com/',
              description: 'csrf protection cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /CRAFT_CSRF_TOKEN/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CMS'],
              vendor: 'Craft',
              product: 'CMS',
              website: 'https://craftcms.com/',
              description: 'x-powered-by header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by: Craft CMS/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
