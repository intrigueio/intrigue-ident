module Intrigue
  module Ident
    module Check
      class Twiki < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'Twiki',
              product: 'Twiki',
              website: 'https://twiki.org/',
              description: 'Twiki - TWIKISID Cookie Match',
              version: nil,
              match_type: :content_cookies,
              match_content: /TWIKISID/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
