module Intrigue
  module Ident
    module Check
      class Haskell < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Haskell',
              product: 'Snap',
              website: 'https://hackage.haskell.org/package/snap',
              description: 'Haskell Snap - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{server: Snap/[\d.]+$}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: Snap/([\d.]+)$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
