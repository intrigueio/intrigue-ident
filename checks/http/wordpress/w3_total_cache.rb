module Intrigue
  module Ident
    module Check
      class WordpressW3TotalCache < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Wordpress Plugin'],
              vendor: 'Wordpress',
              product: 'W3 Total Cache',
              website: 'https://wordpress.org/plugins/w3-total-cache/',
              description: 'powered by header',
              match_type: :content_headers,
              match_content: %r{x-powered-by: W3 Total Cache/.*}i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{x-powered-by: W3 Total Cache/(.*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              require_product: 'Wordpress',
              inference: false
            }
          ]
        end
      end
    end
  end
end
