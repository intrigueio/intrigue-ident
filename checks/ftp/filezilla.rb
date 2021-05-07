module Intrigue
  module Ident
    module FtpCheck
      class Filezilla < Intrigue::Ident::FtpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['FTP Server'],
              vendor: 'Filezilla',
              product: 'Server',
              website: 'https://filezilla-project.org/download.php?type=server',
              version: nil,
              match_logic: :any,
              description: 'Filezilla Server - FTP banner.',
              matches: [
                {
                  match_type: :content_banner,
                  match_content: /FileZilla Server/i
                }
              ],
              dynamic_version: lambda { |x|
                _first_banner_capture(x, /FileZilla Server (?:version )?(\d+(\.\d+)*)/i)
              },
              hide: false,
              inference: true
            }
          ]
        end
      end
    end
  end
end
