module Intrigue
  module Ident
    module UpnpCheck
      class Realtek < Intrigue::Ident::UpnpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['UpnpServer'],
              vendor: 'Realtek',
              product: 'Realtek',
              references: [],
              match_type: :content_banner,
              match_content: /Realtek\/V([\d\.]+)\s/i,
              dynamic_version: lambda { |x|
                _first_banner_capture(x,/Realtek\/V([\d\.]+)\s/i)
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
