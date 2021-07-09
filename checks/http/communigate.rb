module Intrigue
  module Ident
    module Check
      class Communigate < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              vendor: 'Communigate',
              category: 'application',
              tags: ['COTS', 'Marketing', 'Web Server'],
              product: 'CommuniGate',
              website: 'http://www.stalker.com/CommuniGatepro/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: CommuniGatePro/
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: CommuniGatePro/(\d+(\.\d+)*)}i)
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
