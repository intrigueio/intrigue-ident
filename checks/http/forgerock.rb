module Intrigue
  module Ident
    module Check
      class ForgeRock < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Library IAM],
              vendor: 'ForgeRock',
              product: 'OpenAM',
              website: 'https://github.com/OpenIdentityPlatform/OpenAM/',
              description: 'title',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /OpenAM \(Login\)/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Library IAM],
              vendor: 'ForgeRock',
              product: 'OpenAM',
              website: 'https://github.com/OpenIdentityPlatform/OpenAM/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{server:.*OpenAM Web Agent/[\d.]+$}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server:.*OpenAM Web Agent/([\d.]+)$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
