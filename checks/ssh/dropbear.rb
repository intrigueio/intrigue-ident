module Intrigue
  module Ident
    module SshCheck
      class Dropbear < Intrigue::Ident::SshCheck::Base
        def generate_checks
          [
            { # SSH-2.0-dropbear_2016.74
              type: 'fingerprint',
              category: 'application',
              tags: ['SSHServer'],
              vendor: 'Dropbear SSH Project',
              product: 'Dropbear SSH',
              references: [],
              version: nil,
              match_type: :content_banner,
              match_content: /dropbear/i,
              dynamic_version: lambda { |x|
                                 _first_banner_capture(x, /SSH-2.0-dropbear_([\d.]+)\r\n/i)
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
