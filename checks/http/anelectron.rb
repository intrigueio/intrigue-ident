module Intrigue
  module Ident
    module Check
      class Anelectron < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Anelectron',
              product: 'Advanced Electron Forum',
              references: [],
              version: nil,
              match_type: :content_body,
              match_content: /Powered By AEF/i,
              description: 'powered by message',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
