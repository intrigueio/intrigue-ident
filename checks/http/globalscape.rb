module Intrigue
  module Ident
    module Check
      class Globalscape < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'Globalscape',
              product: 'Secure FTP Server',
              website: 'https://www.globalscape.com/solutions/sftp-servers',
              description: 'lost password link',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{/EFTClient/Account/LostPassword.htm}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
