module Intrigue
  module Ident
    module Check
      class Bower < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Javascript', 'Package Manager'],
              vendor: 'Bower',
              product: 'Bower',
              website: 'https://github.com/bower/bower',
              description: 'scripts loaded via bower',
              version: nil,
              match_type: :content_body,
              match_content: %r{/bower_components/},
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
