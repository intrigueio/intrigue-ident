module Intrigue
  module Ident
    module FtpCheck
      class ProFtp < Intrigue::Ident::FtpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['FTP Server'],
              vendor: 'ProFTP',
              product: 'ProFTPd',
              references: [],
              version: nil,
              match_type: :content_banner,
              match_content: /ProFTPD [\d\w.]+ Server/i,
              dynamic_version: ->(x) { _first_banner_capture(x, /ProFTPD ([\d\w.]+) Server/i) },
              description: 'banner',
              hide: false,
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['FTP Server'],
              vendor: 'ProFTP',
              product: 'ProFTPd',
              references: [],
              version: nil,
              match_type: :content_banner,
              match_content: /ProFTPD Server/i,
              description: 'banner, no version',
              hide: false,
              inference: false
            }
          ]
        end
      end
    end
  end
end
