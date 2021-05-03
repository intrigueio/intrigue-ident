module Intrigue
  module Ident
    module Check
      class Jetbrains < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Development],
              vendor: 'JetBrains',
              product: 'TeamCity',
              website: 'https://www.jetbrains.com/teamcity/',
              description: 'JetBrains TeamCity - TeamCity Black SVG Page Reference',
              version: nil,
              match_type: :content_body,
              match_content: %r{icons/teamcity.black.svg}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
