module Intrigue
  module Ident
    module Check
      class Restlet < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Restlet',
              product: 'Restlet',
              description: 'server header for Restlet',
              references: ['http://restlet.com/company/blog/2016/02/03/api-testing-testing-web-apis-using-dhc-by-restlet/'],
              match_type: :content_headers,
              match_content: /server: Restlet-Framework/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: Restlet-Framework/(.*)}i)
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
