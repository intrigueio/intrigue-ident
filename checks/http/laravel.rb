module Intrigue
  module Ident
    module Check
      class Laravel < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Security'],
              vendor: 'Laravel',
              product: 'Laravel',
              website: 'https://laravel.com/',
              description: 'cookie',
              version: nil,
              match_type: :content_cookies,
              match_content: /laravel_session=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
