module Intrigue
  module Ident
    module Check
      class Appdynamics < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[APM JavaScript],
              website: 'https://www.appdynamics.com/',
              vendor: 'AppDynamics',
              product: 'AppDynamics',
              version: nil,
              description: 'AppDynamics - Cookies Match',
              match_logic: :any,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /ADRUM_BTa=/,
                },
                {
                  match_type: :content_cookies,
                  match_content: /ADRUM_BT1=/,
                }
              ],
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
