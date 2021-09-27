module Intrigue
  module Ident
    module UpnpCheck
      class MiniUpnpd < Intrigue::Ident::UpnpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['UpnpServer'],
              vendor: 'MiniUPnPd',
              product: 'MiniUPnPd',
              references: [],
              match_type: :content_banner,
              match_content: /MiniUPnPd/i,
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
