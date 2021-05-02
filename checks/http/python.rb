module Intrigue
  module Ident
    module Check
      class Python < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework', 'Language'],
              vendor: 'Python',
              product: 'Python',
              website: 'https://www.python.org/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*Python.*$/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^server:.*Python/([\d.]*).*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework', 'Language'],
              vendor: 'Python',
              product: 'Python',
              website: 'https://www.python.org/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*CPython.*$/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^server:.*CPython/([\d.]*).*$}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Python',
              product: 'SimpleHTTP',
              website: 'https://docs.python.org/2/library/simplehttpserver.html',
              references: [''],
              version: nil,
              match_type: :content_headers,
              match_content: /Server: SimpleHTTP.*/i,
              dynamic_version: ->(x) { _first_header_capture(x, %r{Server: SimpleHTTP/([\d.]+)}i) },
              description: 'server header',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
