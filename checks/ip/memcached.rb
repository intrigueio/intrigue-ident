module Intrigue
    module Ident
      module IpCheck
        class Memcached < Intrigue::Ident::IpCheck::Base
          def generate_checks
            [
              {
                type: 'fingerprint',
                category: 'application',
                tags: %w[Network Tcp Memcached],
                vendor: 'Memcached',
                product: 'Memcached',
                description: 'match via protocol response string',
                references: [
                  'https://memcached.org/'
                ],
                request_type: :plain,
                protocol: :tcp,
                request_content: "stats\r\n\r\nquit\r\n",
                # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
                match_content: /^.*STAT\s.*$/i
              }
            ]
          end
        end
      end
    end
  end
  