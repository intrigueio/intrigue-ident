module Intrigue
  module Ident
    module Check
      class Nodejs < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server', 'Language'],
              vendor: 'Node.js',
              product: 'Node.js',
              website: 'https://nodejs.org/',
              description: 'Node.js - unique error page',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{^<pre>Cannot GET /doesntexist-123</pre>$}i,
                }
              ],
              paths: [{ path: "#{url}/doesntexist-123", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server', 'Language'],
              vendor: 'Node.js',
              product: 'Node.js',
              website: 'https://nodejs.org/',
              description: 'Node.js - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by: nodejs$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^server: nodejs$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server', 'Language'],
              vendor: 'Node.js',
              product: 'Node.js',
              website: 'https://nodejs.org/',
              description: 'Node.js - Unique Error Page (sails)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /sails.sid=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework'],
              vendor: 'Sails.js',
              product: 'Sails',
              website: 'https://sailsjs.com/',
              description: 'Sails.js - X-Powered-By Header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by: Sails$/i,
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
