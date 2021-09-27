module Intrigue
  module Ident
    module UpnpCheck
      class Hue < Intrigue::Ident::UpnpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['UpnpServer'],
              vendor: 'Hue',
              product: 'Hue',
              references: [],
              match_type: :content_banner,
              match_content: /Hue\/([\d\.]+)\s/i,
              dynamic_version: lambda { |x|
                _first_banner_capture(x,/Hue\/([\d\.]+)\s/i)
              },
              description: 'banner',
              hide: false,
              inference: true
            }
          ]
        end
      end
    end
  end
end
