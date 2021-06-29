module Intrigue
  module Ident
    module IpCheck
      class Apache < Intrigue::Ident::IpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Network Tcp Zookeeper],
              vendor: 'Apache',
              product: 'Zookeeper',
              description: 'match via protocol response string',
              references: [
                'https://zookeeper.apache.org/'
              ],
              request_type: :plain,
              protocol: :tcp,
              request_content: "envi\r\nquit\r\n",
              # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
              match_content: /^.*zookeeper.version.*$/i,
              dynamic_version: lambda { |x|
                _first_banner_capture(x,  /^.*zookeeper.version=(.*),.*$/i)
              }
            }
          ]
        end
      end
    end
  end
end
