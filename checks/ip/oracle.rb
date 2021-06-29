module Intrigue
  module Ident
    module IpCheck
      class Oracle < Intrigue::Ident::IpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Tcp Oracle],
              vendor: 'Oracle',
              product: 'WebLogic Server',
              description: 'match via T3 protocol response string',
              references: [
                'https://www.oracle.com/middleware/technologies/weblogic.html'
              ],
              request_type: :plain,
              protocol: :tcp,
              request_content: "t3 12.2.1\nAS:255\nHL:19\nMS:10000000\nPU:t3://us-l-breens:7001\n\n",
              # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
              match_content: /^HELO:.*$/i,
              dynamic_version: lambda { |x|
                                 _first_banner_capture(x, /^HELO:(.*)\.false.*$/i)
                               }
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Tcp Oracle],
              vendor: 'Oracle',
              product: 'WebLogic Server',
              description: 'match via IIOP protocol response string',
              references: [
                'https://docs.oracle.com/cd/E13222_01/wls/docs81/ConsoleHelp/domain_server_protocols_iiop.html',
                'https://docs.oracle.com/cd/E24329_01/web.1211/e24389/iiop_basic.htm#WLRMI155'
              ],
              request_type: :plain,
              protocol: :tcp,
              request_content: "{{hex_decode('47494f50010200030000001700000002000000000000000b4e616d6553657276696365')}}",
              # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
              match_content: /^GIOP.*$/i
            },
          ]
        end
      end
    end
  end
end
