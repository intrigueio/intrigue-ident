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
              description: 'string in wp-json',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /contact-form-7/i,
                }
              ],
              version: nil,
              paths: [{ path: "#{url}/wp-json", follow_redirects: true }],
              require_product: 'Wordpress',
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Wordpress Plugin'],
              vendor: 'RockLobster',
              product: 'Contact Form 7',
              description: 'plugin',
              website: 'https://contactform7.com/',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /wpcf7-form/i,
                }
              ],
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
