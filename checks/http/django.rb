module Intrigue
  module Ident
    module Check
      class Django < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server', 'Login Panel'],
              vendor: 'Django',
              product: 'Django',
              website: 'https://www.djangoproject.com/',
              version: nil,
              description: 'Django Admin Page',
              require_product: 'Django',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Django site admin/
                },
                {
                  match_type: :content_body,
                  match_content: /Django - Login panel page reference/
                }
              ],
              paths: [
                { path: "#{url}/admin", follow_redirects: true },
                { path: "#{url}/admin/login/?next=/admin/", follow_redirects: true }
              ],
              inference: false
            }
          ]
        end
      end
    end
  end
end
