module Intrigue
  module Ident
    module Check
      class MHCSoftwareInc < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS', 'Web Server'],
              vendor: 'MHCSoftwareInc',
              product: 'Document Self-Service',
              references: ['https://www.mhcsoftwareinc.com/platform/application-suites/document-self-service/'],
              version: nil,
              description: 'MHCSoftwareInc Document Self-Service - Server Header',
              match_type: :content_headers,
              match_content: %r{^server:\ DSS Web Server/(\d\.\d)$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server:\ DSS Web Server/(\d\.\d)$}i)
                               },
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
