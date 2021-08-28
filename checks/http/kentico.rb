module Intrigue
  module Ident
    module Check
      class Kentico < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CMS'],
              website: 'https://www.kentico.com/',
              vendor: 'Kentico',
              product: 'Kentico',
              references: ['https://docs.kentico.com/k11/configuring-kentico/adding-cookie-law-consent-to-web-pages/reference-kentico-cookies'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /CMSPreferredCulture=/i,
                }
              ],
              description: 'cookie match',
              inference: false,
              paths: [{ path: url.to_s, follow_redirects: true }]
            }
          ]
        end
      end
    end
  end
end
