module Intrigue
  module Ident
    module Check
      class VBulletin < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Social'],
              vendor: 'vBulletin', # Jelsoft Enterprises Limited
              product: 'vBulletin',
              website: 'https://www.vbulletin.com/',
              description: 'vBulletin - Cookies Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /bb_?lastactivity=/,
                },
                {
                  match_type: :content_cookies,
                  match_content: /bb_?lastvisit=/,
                },
                {
                  match_type: :content_cookies,
                  match_content: /bb_?sessionhash=/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Social'],
              vendor: 'vBulletin',
              product: 'vBulletin',
              website: 'https://www.vbulletin.com/',
              description: "vBulletin - 'powered by' page reference",
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Powered by vBulletin®?/,
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
