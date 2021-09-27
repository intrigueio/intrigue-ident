module Intrigue
  module Ident
    module UpnpCheck
      class Linux < Intrigue::Ident::UpnpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['UpnpServer'],
              vendor: 'Linux',
              product: 'Kernel',
              references: [],
              match_type: :content_banner,
              match_content: /LINUX-([\d\.]+)\s/i,
              dynamic_version: lambda { |x|
                _first_banner_capture(x,/LINUX-([\d\.]+)\s/i)
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
