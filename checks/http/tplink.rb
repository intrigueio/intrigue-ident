module Intrigue
    module Ident
      module Check
        class TPLink < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Networking', 'COTS', 'Router'],
                vendor: 'TP-Link',
                product: 'WR Series',
                description: 'TP-Link Wireless Router',
                references: [
                  'https://www.tp-link.com/us/search/?q=tl-wr&t=product'
                ],
                match_type: :content_headers,
                match_content: /^server: Router Webserver$/i,
                dynamic_version: lambda { |x|
                                   _first_header_capture(x, /^server: Router Webserver$/i)
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