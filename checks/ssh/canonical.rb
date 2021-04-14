module Intrigue
  module Ident
    module SshCheck
      class Ubuntu < Intrigue::Ident::SshCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['OperatingSystem'],
              vendor: 'Canonical',
              product: 'Ubuntu Linux',
              references: ['https://launchpad.net/ubuntu/xenial/amd64/openssh-server/1:7.2p2-4ubuntu2.8'],
              match_logic: :any,
              description: 'Canonical Ubuntu Linux - ssh banner',
              version: nil,
              matches: [
                {
                  match_type: :content_banner,
                  match_content: /Ubuntu/i
                }
              ],
              dynamic_version: lambda { |x|
                _first_banner_capture(x, /Ubuntu(?:0.)?(\d+(\.\d+)*)/i)
              },
              inference: false
            }
          ]
        end
      end
    end
  end
end
