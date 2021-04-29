module Intrigue
  module Ident
    module Check
      class IDEATEC < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WebServer Security],
              vendor: 'IDEATEC',
              product: 'SmartXFilter',
              description: 'server header',
              references: [
                'https://ideatec.co.kr/SmartXFilter_index'
              ],
              match_type: :content_headers,
              match_content: %r{^server: SmartXFilter$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: SmartXFilter$}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
                type: 'fingerprint',
                category: 'application',
                tags: %w[WebServer Security],
                vendor: 'IDEATEC',
                product: 'SmartXFilter',
                description: 'server header',
                references: [
                  'https://ideatec.co.kr/SmartXFilter_index'
                ],
                match_type: :content_headers,
                match_content: %r{^via:.*SmartXFilter.*$}i,
                dynamic_version: lambda { |x|
                                   _first_header_capture(x, %r{^via:.*SmartXFilter.*$}i)
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
