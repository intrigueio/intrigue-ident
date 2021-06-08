module Intrigue
  module Ident
    module Check
      class WordpressRocklobster < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Wordpress Plugin'],
              vendor: 'Rocklobster',
              product: 'Contact Form 7',
              website: 'https://contactform7.com/',
              description: 'Rocklobster Contact Form 7 - Plugin Match',
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /contact-form-7/i,
                },
                {
                  match_type: :content_body,
                  match_content: /wpcf7-form/i,
                }
              ],
              version: nil,
              paths: [{ path: "#{url}/wp-json", follow_redirects: true }],
              require_product: 'Wordpress',
              inference: false
            },
          ]
        end
      end
    end
  end
end
