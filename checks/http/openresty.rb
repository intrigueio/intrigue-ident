module Intrigue
  module Ident
    module Check
      class OpenResty < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'OpenResty',
              product: 'OpenResty',
              website: 'https://openresty.org/',
              description: 'OpenResty - server header',
              version: nil,
              match_type: :content_headers,
              match_content: /server: (?:ch-)?openresty/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^server: (?:ch-)?openresty/(\d+(\.\d+)*)}i)
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
