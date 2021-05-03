module Intrigue
  module Ident
    module Check
      class Unix4lyfe < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Unix4lyfe',
              product: 'DarkHTTPd',
              website: 'https://unix4lyfe.org/darkhttpd/',
              version: nil,
              match_type: :content_headers,
              match_content: /Server: darkhttpd.*/i,
              dynamic_version: ->(x) { _first_header_capture(x, %r{Server: darkhttpd/([\d.]+)}i) },
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
