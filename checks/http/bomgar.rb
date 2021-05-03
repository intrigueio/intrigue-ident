module Intrigue
  module Ident
    module Check
      class Bomgar < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS', 'IT Support'],
              vendor: 'Bomgar',
              product: 'Remote Support',
              website: 'https://www.beyondtrust.com/remote-support',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: Bomgar$/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
