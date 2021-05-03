module Intrigue
  module Ident
    module Check
      class WordpressJohnGodley < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Wordpress Plugin'],
              vendor: 'John Godley',
              product: 'Redirection',
              description: 'generated by string (body)',
              website: 'https://wordpress.org/plugins/redirection/',
              match_type: :content_body,
              match_content: %r{redirection\\/v1}i,
              version: nil,
              paths: [{ path: "#{url}/wp-json", follow_redirects: true }],
              require_product: 'Wordpress',
              inference: false
            }
          ]
        end
      end
    end
  end
end
