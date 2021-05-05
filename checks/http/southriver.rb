module Intrigue
  module Ident
    module Check
      class SouthRiver < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            { # check may be too broad, there is a string in the body that
              # is more specific to MFT
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'SouthRiver',
              product: 'Cornerstone MFT',
              website: 'https://southrivertech.com/products/cornerstone/',
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: %r{server: SouthRiver/1.0}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            { # check may be too broad, there is a string in the body that
              # is more specific to MFT
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'SouthRiver',
              product: 'Cornerstone MFT',
              website: 'https://southrivertech.com/products/cornerstone/',
              description: 'unique body string',
              version: nil,
              match_type: :content_body,
              match_content: /title="Cornerstone MFT" target="_blank"/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
