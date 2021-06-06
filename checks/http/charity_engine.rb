module Intrigue
  module Ident
    module Check
      class CharityEngine < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CRM'],
              vendor: 'CharityEngine',
              product: 'CharityEngine',
              website: 'https://www.charityengine.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /title="Powered By CharityEngine">/i,
                }
              ],
              description: 'unique body string',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
