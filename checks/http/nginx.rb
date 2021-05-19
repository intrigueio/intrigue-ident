module Intrigue
  module Ident
    module Check
      class Nginx < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Nginx',
              product: 'Nginx',
              website: 'https://www.nginx.com/',
              description: 'Nginx default page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Welcome to nginx!?$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Nginx',
              product: 'Nginx',
              website: 'https://www.nginx.com/',
              description: 'Nginx test page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Test Page for the Nginx HTTP Server/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Nginx',
              product: 'Nginx',
              website: 'https://www.nginx.com/',
              description: 'Nginx - server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server:.*nginx/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^server:.*nginx/([\d.]*).*}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Nginx',
              product: 'Nginx',
              website: 'https://www.nginx.com/',
              description: 'nginx (default page)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<hr><center>nginx/?([\d.]*)</center>}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<hr><center>nginx/?([\d.]*)</center>}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Nginx',
              product: 'Nginx',
              website: 'https://www.nginx.com/',
              description: 'nginx (default page - could be redirect)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<hr><center>nginx/?[\d.]*</center>}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<hr><center>nginx/?([\d.]*)</center>}i)
              },
              paths: [{ path: url.to_s, follow_redirects: false }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
