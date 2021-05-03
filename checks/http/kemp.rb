module Intrigue
  module Ident
    module Check
      class Kemp < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Appliance Administrative],
              vendor: 'Kemp',
              product: 'Edge Security Pack',
              description: 'lm_auth_proxy?LMimage=',
              website: 'https://kemptechnologies.com/loadmaster-family-virtual-server-load-balancers-application-delivery-controllers/',
              match_type: :content_body,
              version: nil,
              references: [
                'https://support.kemptechnologies.com/hc/en-us/articles/203125029-Edge-Security-Pack-ESP-'
              ],
              match_content: /lm_auth_proxy\?LMimage=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
