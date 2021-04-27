module Intrigue
  module Ident
    module Check
      class PSIWBL < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WebServer Embedded Japan],
              vendor: 'PSIWBL',
              product: 'PSIWBL',
              description: 'server header',
              match_type: :content_headers,
              match_content: %r{^server: PSIWBL/?.*$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: PSIWBL/?(.*)?$}i)
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
