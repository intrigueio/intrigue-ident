module Intrigue
  module Ident
    module Check
      class RouteGlobalGroup < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WebServer Embedded],
              vendor: 'Route Global Group',
              product: 'LoadProxy',
              description: 'server header',
              references: [
                'https://www.loadproxy.com/'
              ],
              match_type: :content_headers,
              match_content: %r{^server: LoadProxy/?.*$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: LoadProxy/?(.*)?$}i)
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
