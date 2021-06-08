module Intrigue
  module Ident
    module Check
      class Lcn < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Hosting CDN],
              vendor: 'LCN',
              product: 'LCN',
              website: 'https://www.lcn.com/',
              description: 'body error message',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /This website is temporarily offline - LCN.com/,
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
