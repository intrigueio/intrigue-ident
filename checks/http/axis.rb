module Intrigue
  module Ident
    module Check
      class Axis < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['Embedded', 'OS'],
              vendor: 'Axis',
              product: 'Network Camera Firmware',
              website: 'https://www.axis.com/en-gb/products/network-cameras',
              description: 'default redirect uri',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<META HTTP-EQUIV="Refresh" CONTENT="0; URL=/view/viewer_index.shtml?id=},
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['Embedded', 'OS'],
              vendor: 'Axis',
              product: 'Network Camera Firmware',
              website: 'https://www.axis.com/en-gb/products/network-cameras',
              description: 'AXIS title',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /AXIS/,
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
