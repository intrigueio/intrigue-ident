module Intrigue
  module Ident
    module Check
      class ManageEngine < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Management'],
              vendor: 'ManageEngine',
              product: 'ServiceDesk Plus',
              website: 'https://www.manageengine.com/products/service-desk/',
              description: 'cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /SDPSESSIONID=/i,
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
