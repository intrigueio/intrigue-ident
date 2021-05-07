module Intrigue
  module Ident
    module Check
      class Cerberus < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS', 'FTP Server'],
              vendor: 'Cerberus',
              product: 'Ftp Server',
              website: 'https://www.cerberusftp.com/',
              description: 'Cerberus Ftp Server - Server Header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server:.*Cerberus.*$/,
              dynamic_version: ->(x) { _first_header_capture(x, %r{^server:.*Cerberus/([\d.]*)\s.*$}i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
