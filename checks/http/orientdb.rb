module Intrigue
  module Ident
    module Check
      class Orientdb < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Orientdb DatabaseService],
              vendor: 'Orientdb',
              product: 'Orientdb',
              website: 'https://www.orientdb.org/',
              description: 'response header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: OrientDB Server/i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /server: OrientDB Server v.(\d+\.\d+\.\d+)/i)
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
