module Intrigue
  module Ident
    module Check
      class Lighttpd < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Lighttpd',
              product: 'Lighttpd',
              website: 'https://www.lighttpd.net/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /server: lighttpd/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: lighttpd/(.*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              examples: ['lighttpd/1.4.23-devel-Unversioned directory'],
              inference: true
            }
          ]
        end
      end
    end
  end
end
