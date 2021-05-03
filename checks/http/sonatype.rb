module Intrigue
  module Ident
    module Check
      class Sonatype < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Security],
              vendor: 'Sonatype',
              product: 'Nexus Repository Manager',
              description: 'product name in body',
              references: [],
              version: nil,
              match_type: :content_title,
              match_content: /Nexus Repository Manager/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Security],
              vendor: 'Sonatype',
              product: 'Nexus Repository Manager',
              description: 'version in body - specific to oss?',
              references: [],
              version: nil,
              match_type: :content_body,
              match_content: /app\.js\?_v=[\d.\-]+&_e=/i,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /app\.js\?_v=([\d.\-]+)&_e=/i)
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
