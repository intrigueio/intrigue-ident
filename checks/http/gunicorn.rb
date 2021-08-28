module Intrigue
  module Ident
    module Check
      class Gunicorn < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS', 'Development', 'Web Server'],
              vendor: 'Gunicorn',
              product: 'Gunicorn',
              website: 'https://gunicorn.org/',
              description: 'server',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: gunicorn/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: gunicorn/(\d+(\.\d+)*)$})
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
