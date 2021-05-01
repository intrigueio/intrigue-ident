module Intrigue
  module Ident
    module Check
      class Cente < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WebServer Embedded],
              vendor: 'Cente',
              product: 'CenteHTTPd',
              description: 'server header',
              references: [
                'https://www.cente.jp/product/cente-middle/tcpip/app/httpdc/'
              ],
              match_type: :content_headers,
              match_content: %r{^server: CenteHTTPd\/.*$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: CenteHTTPd\/(.*)$}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end