module Intrigue
  module Ident
    module Check
      class Brocade < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: %w[Appliance Networking],
              vendor: 'Brocade',
              product: 'ICX7250-24',
              website: 'https://www.broadcom.com/',
              version: nil,
              match_type: :content_body,
              match_content: %r{Images/uicx_7250_24_gfphdr_login1.gif},
              description: 'specific image',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Appliance Networking],
              vendor: 'Brocade',
              product: 'Fabric OS',
              website: 'https://www.broadcom.com/products/fibre-channel-networking/software/fabric-operating-system',
              version: nil,
              match_type: :content_body,
              match_content: %r{<td><img src="Images/brocade_logo_no_text.gif">},
              description: 'specific image',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
