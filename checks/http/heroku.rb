module Intrigue
  module Ident
    module Check
      class Heroku < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['PaaS'],
              vendor: 'Heroku',
              product: 'Heroku',
              website: 'https://www.heroku.com/',
              description: 'Heroku (error page)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{src="//www.herokucdn.com/error-pages/no-such-app.html},
                }
              ],
              dynamic_hide: lambda { |x|
                return true if _uri_match(x, /heroku.com/)       ||
                               _uri_match(x, /herokussl.com/)    ||
                               _uri_match(x, /herokudns.com/)    ||
                               _uri_match(x, /herokuapp.com/)    ||
                               _uri_match(x, /amazonaws.com/)    ||
                               _uri_match(x, /\d+.\d+.\d+.\d+:/)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['PaaS'],
              vendor: 'Heroku',
              product: 'Heroku',
              website: 'https://www.heroku.com/',
              description: 'Heroku vegur server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^via: [\d.]+ vegur/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['PaaS'],
              vendor: 'Heroku',
              product: 'Heroku',
              website: 'https://www.heroku.com/',
              description: 'Heroku header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: Cowboy$/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['PaaS'],
              vendor: 'Heroku',
              product: 'Heroku',
              website: 'https://www.heroku.com/',
              description: 'heroku offline iframe',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{www\.herokucdn\.com/error-pages/maintenance-mode\.html"></iframe>}i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
