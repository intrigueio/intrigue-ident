module Intrigue
  module Ident
    module Check
      class Echostar < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Webserver Embedded],
              vendor: 'Echostar',
              product: 'Echostar',
              description: 'server header',
              match_type: :content_headers,
              match_content: %r{^server: echostar$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: echostar$}i)
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
