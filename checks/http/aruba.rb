module Intrigue
  module Ident
    module Check
      class Aruba < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS Wireless],
              vendor: 'Aruba Networks',
              product: 'Aruba OS',
              website: 'https://www.arubanetworks.com/',
              version: nil,
              match_type: :content_body,
              match_content: /arubalp=/,
              description: 'Matches an aruba link, generic identifier',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
