module Intrigue
  module Ident
    module Check
      class MediaTemple < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['SaaS'],
              vendor: 'MediaTemple',
              product: 'MediaTemple',
              website: 'https://mediatemple.net/',
              description: 'default string in title',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Business-Class Web Hosting by \(mt\) Media Temple/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
