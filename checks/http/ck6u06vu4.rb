module Intrigue
  module Ident
    module Check
      class CK6u06Vu4 < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WebServer China],
              vendor: 'CK6u06Vu4',
              product: 'CK6u06Vu4',
              description: 'server header',
              match_type: :content_headers,
              match_content: %r{^server: CK6u06Vu4$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: CK6u06Vu4$}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WebServer China],
              vendor: 'CK6u06Vu4',
              product: 'CK6u06Vu4',
              description: 'server header',
              match_type: :content_headers,
              match_content: %r{^X-Non-Compliaence:.*CK6u06Vu4.*$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^X-Non-Compliaence:.*CK6u06Vu4.*$}i)
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
