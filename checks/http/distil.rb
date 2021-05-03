module Intrigue
  module Ident
    module Check
      class Distil < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF],
              vendor: 'Distil',
              product: 'Distil',
              website: 'https://www.imperva.com/products/advanced-bot-protection-management/',
              description: 'unique header',
              version: nil,
              match_type: :content_headers,
              match_content: /x-distil-cs/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
