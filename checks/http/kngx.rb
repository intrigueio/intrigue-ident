module Intrigue
  module Ident
    module Check
      class KNGX < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'Embedded'],
              vendor: 'KNGX',
              product: 'KNGX',
              description: 'server header',
              references: [
                'https://segmentfault.com/q/1010000038917829'
              ],
              match_type: :content_headers,
              match_content: %r{^server: KNGX-.*$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: KNGX-(.*)$}i)
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
