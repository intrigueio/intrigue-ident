module Intrigue
  module Ident
    module Check
      class DevPhp < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['COTS', 'Web Framework'],
              vendor: 'Dev-PHP',
              product: 'IDE',
              website: 'http://devphp.sourceforge.net/',
              description: 'generator',
              version: nil,
              match_type: :content_generator,
              match_content: /^Dev-PHP .*$/i,
              dynamic_version: lambda { |x|
                _first_generator_capture(x, /^Dev-PHP (.*)$/i)
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
