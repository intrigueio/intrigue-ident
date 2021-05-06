module Intrigue
  module Ident
    module Check
      class Yaws < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['ApplicationServer'],
              vendor: 'Yaws',
              product: 'Yaws',
              description: 'server header',
              references: ['https://en.wikipedia.org/wiki/Yaws_(web_server)'],
              match_type: :content_headers,
              match_content: /server: Yaws/i,
              dynamic_version: lambda { |x|
                _first_header_capture(x, /server: Yaws (.*)/i)
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
