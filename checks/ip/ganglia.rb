module Intrigue
    module Ident
      module IpCheck
        class Ganglia < Intrigue::Ident::IpCheck::Base
          def generate_checks
            [
              {
                type: 'fingerprint',
                category: 'application',
                tags: %w[Network Tcp Ganglia],
                vendor: 'Ganglia',
                product: 'Ganglia',
                description: 'match via protocol response string',
                references: [
                  'http://ganglia.info/'
                ],
                request_type: :plain,
                protocol: :tcp,
                request_content: "\r\n",
                # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
                match_content: /^.*<!DOCTYPE\sGANGLIA_XML.*$/i
              }
            ]
          end
        end
      end
    end
  end
  