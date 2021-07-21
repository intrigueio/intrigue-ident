module Intrigue
  module Ident
    module Check
      class Synacor < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Productivity', 'Cloud', 'SaaS'],
              vendor: 'Synacor',
              product: 'Zimbra Collaboration Suite',
              website: 'https://www.zimbra.com/',
              version: nil,
              description: 'login page for zimbra',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Zimbra Web Client Sign In/i,
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
