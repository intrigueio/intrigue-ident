module Intrigue
  module Ident
    module Check
      class Magnolia < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS CMS],
              vendor: 'Magnolia',
              product: 'Magnolia',
              website: 'https://www.magnolia-cms.com/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^x-magnolia-registration:/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
