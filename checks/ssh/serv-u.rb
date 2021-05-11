module Intrigue
  module Ident
    module SshCheck
      class Solarwinds < Intrigue::Ident::SshCheck::Base
        def generate_checks
          [
            { # SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.8
              type: 'fingerprint',
              category: 'application',
              tags: ['FTP Server'],
              vendor: 'Solarwinds',
              product: 'Serv-U',
              match_type: :content_banner,
              match_content: /SSH-2.0-Serv-U_[\d.]+\r\n/i,
              dynamic_version: ->(x) { _first_banner_capture(x, /^SSH-2.0-Serv-U_([\d.]+)\r\n$/i) },
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
