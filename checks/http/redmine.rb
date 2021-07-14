module Intrigue
  module Ident
    module Check
      class Redmine < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Administrative', 'Management'],
              vendor: 'Redmine',
              product: 'Redmine',
              website: 'https://www.redmine.org/',
              description: 'redmine cookie',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /_redmine_session=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Administrative', 'Management'],
              vendor: 'Redmine',
              product: 'Redmine',
              website: 'https://www.redmine.org/',
              description: 'redmine title',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Redmine$/i,
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
