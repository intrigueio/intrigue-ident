module Intrigue
  module Ident
    module Check
      class Modwsgi < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Library'],
              vendor: 'modwsgi',
              product: 'mod_wsgi',
              website: 'https://modwsgi.readthedocs.io/en/master/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^.*mod_wsgi/.*$}i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^.*mod_wsgi/([\w\d.\-]*)\s.*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
