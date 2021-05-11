module Intrigue
  module Ident
    module FtpCheck
      class PureFtpd < Intrigue::Ident::FtpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['FTP Server'],
              vendor: 'PureFtpd',
              product: 'PureFtpd',
              references: [],
              version: nil,
              match_type: :content_banner,
              match_content: /Welcome to Pure-FTPd/i,
              description: 'banner',
              hide: false,
              inference: false
            }
          ]
        end
      end
    end
  end
end
