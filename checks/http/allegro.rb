module Intrigue
  module Ident
    module Check
      class Allegro < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'Embedded'],
              vendor: 'Allegro',
              product: 'RomPager',
              website: 'https://www.allegrosoft.com/product/embedded-internet-toolkits/rompager-web-server/',
              version: nil,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{Allegro-Software-RomPager/(.*)$}i)
                               },
              match_type: :content_headers,
              match_content: /server:\ Allegro-Software-RomPager/,
              description: 'Allegro RomPager - Server Header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
