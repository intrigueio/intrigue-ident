module Intrigue
  module Ident
    module Check
      class Baidu < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Search', 'Website'],
              vendor: 'Baidu',
              product: 'Baidu',
              website: 'https://www.baidu.com/',
              description: 'Baidu - Favicon Hash',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :checksum_body_mmh3,
                  match_content: -1_104_297_575,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
