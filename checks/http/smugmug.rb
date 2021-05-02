module Intrigue
  module Ident
    module Check
      class Smugmug < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['SaaS'],
              vendor: 'SmugMug',
              product: 'SmugMug',
              references: ['https://www.smugmug.com/'],
              match_type: :content_headers,
              match_content: /P3P: CP="This is not a P3P policy. SmugMug respects your privacy/i,
              description: 'header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
