module Intrigue
  module Ident
    module Check
      class Debian < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['OS'],
              vendor: 'Debian',
              product: 'Linux',
              website: 'https://www.debian.org/',
              description: 'nginx test page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Welcome to nginx on Debian!$/i,
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
