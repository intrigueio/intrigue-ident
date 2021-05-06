module Intrigue
  module Ident
    module Check
      class ExpressJS < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'ExpressJS',
              product: 'Express',
              website: 'https://expressjs.com/',
              version: nil,
              description: 'x-powered-by header',
              match_type: :content_headers,
              match_content: /x-powered-by: Express/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
