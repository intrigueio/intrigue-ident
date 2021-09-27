module Intrigue
  module Ident
    module UpnpCheck
      class Generic < Intrigue::Ident::UpnpCheck::Base
        # 220 1.1.1.1 FTP server ready
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['UpnpServer'],
              vendor: 'Generic',
              product: 'UPNP',
              references: [],
              version: nil,
              match_type: :content_banner,
              match_content: /.*/i,
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
