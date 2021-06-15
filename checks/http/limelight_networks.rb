module Intrigue
  module Ident
    module Check
      class LimelightNetworks < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'CDN'],
              vendor: 'Limelight Networks',
              product: 'Edgeprism',
              website: 'https://www.limelight.com/',
              description: 'Limelight Networks Edgeprism - Server Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: EdgePrism.*/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: EdgePrism/(.*)}i)
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
