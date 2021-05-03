module Intrigue
  module Ident
    module Check
      class Baidu < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Search SaaS],
              vendor: 'Baidu',
              product: 'Baidu',
              website: 'https://www.baidu.com/',
              description: 'Baidu - Favicon Hash',
              version: nil,
              match_type: :checksum_body_mmh3,
              match_content: -1_104_297_575,
              paths: [{ path: "#{url}/favicon.ico", follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
