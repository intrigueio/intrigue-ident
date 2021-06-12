module Intrigue
  module Ident
    module Check
      class Publicfile < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'FTP Server'],
              vendor: 'Publicfile',
              product: 'Publicfile',
              description: 'server header',
              website: 'https://cr.yp.to/publicfile.html',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: publicfile$/i,
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
