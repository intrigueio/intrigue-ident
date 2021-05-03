module Intrigue
  module Ident
    module Check
      class Skrollr < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Javascript'],
              vendor: 'Skrollr',
              product: 'Skrollr',
              website: 'https://github.com/Prinzhorn/skrollr',
              match_type: :content_body,
              match_content: /class="\w*\s?skrollr-desktop/i,
              description: 'javascript class load',
              paths: [{ path: url.to_s, follow_redirects: true }],
              eol: '2014-09-01',
              inference: false
            }
          ]
        end
      end
    end
  end
end
