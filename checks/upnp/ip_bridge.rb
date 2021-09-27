module Intrigue
  module Ident
    module UpnpCheck
      class IpBridge < Intrigue::Ident::UpnpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['UpnpServer'],
              vendor: 'IpBridge',
              product: 'IpBridge',
              references: [],
              match_type: :content_banner,
              match_content: /IpBridge\/([\d\.]+)\s/i,
              dynamic_version: lambda { |x|
                _first_banner_capture(x,/IpBridge\/([\d\.]+)\s/i)
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
