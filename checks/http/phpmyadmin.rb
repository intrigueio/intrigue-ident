module Intrigue
  module Ident
    module Check
      class PhpMyAdmin < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Administrative COTS],
              vendor: 'PhpMyAdmin',
              product: 'PhpMyAdmin',
              website: 'https://www.phpmyadmin.net/',
              description: 'PhpMyAdmin',
              version: nil,
              match_type: :content_cookies,
              match_content: /phpMyAdmin=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Administrative COTS],
              vendor: 'PhpMyAdmin',
              product: 'PhpMyAdmin',
              website: 'https://www.phpmyadmin.net/',
              description: 'PhpMyAdmin',
              version: nil,
              match_type: :content_title,
              match_content: /^PhpMyAdmin$/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
