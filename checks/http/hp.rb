module Intrigue
  module Ident
    module Check
      class Hp < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Embedded Printer],
              vendor: 'HP',
              product: 'HP-ChaiSOE',
              website: 'https://www.hp.com/',
              version: '1.0',
              match_type: :content_headers,
              match_content: %r{server: HP-ChaiSOE/1.0}i,
              description: 'Generic HP Printer match',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
