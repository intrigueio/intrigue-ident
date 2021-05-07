module Intrigue
  module Ident
    module Check
      class OpenTextWebSolutionsCMS < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['CMS'],
              vendor: 'OpenText',
              product: 'OpenText Web Solutions',
              references: ['https://www.opentext.com/products-and-solutions/products/customer-experience-management/web-content-management/web-site-management'],
              version: nil,
              match_type: :content_body,
              match_content: /published by open text web solutions (.*.\d)/i,
              dynamic_version: ->(x) { _first_body_capture(x, /published by open text web solutions (.*.\d)/i) },
              description: 'header match',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'OpenText',
              product: 'OpenText FirstClass',
              references: ['https://www.opentext.com/products-and-solutions/products/specialty-technologies/firstclass'],
              version: nil,
              description: 'OpenText OpenText FirstClass - Server Header',
              match_type: :content_headers,
              match_content: /^Server:\ OpenText\ FC\ (Sync\ Services|Web Server\ ((\d{1,3}\.){1,9}\d{1,3})\ .{2,30})$/i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       /^Server:\ OpenText\ FC\ (Sync\ Services|Web Server\ ((\d{1,3}\.){1,9}\d{1,3})\ .{2,30})$/i)
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
