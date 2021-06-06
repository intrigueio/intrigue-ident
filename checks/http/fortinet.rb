module Intrigue
  module Ident
    module Check
      class Fortinet < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[VPN Networking],
              vendor: 'Fortinet',
              product: 'FortiOS',
              references: [
                'https://forum.fortinet.com/tm.aspx?m=130869'
              ],
              description: 'FortiGate SSL VPN',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /FortiToken clock drift detected/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[VPN Networking],
              vendor: 'Fortinet',
              product: 'FortiOS',
              references: [],
              description: 'FortiGate SSL VPN',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{top\.location=window\.location;top\.location="/remote/login"}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[VPN Networking],
              vendor: 'Fortinet',
              product: 'FortiGate SSL VPN',
              references: [],
              description: 'Fortinet FortiGate SSL VPN - Body Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{top\.location=window\.location;top\.location="/remote/login"}i,
                },
                {
                  match_type: :content_body,
                  match_content: /FortiToken clock drift detected/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WAF Networking],
              vendor: 'Fortinet',
              product: 'FortiWeb',
              references: [],
              description: 'response header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: fortiweb-.*$/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^server: fortiweb-(\d\.\d\.\d)$/i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
