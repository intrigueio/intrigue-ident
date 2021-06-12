module Intrigue
  module Ident
    module Check
      class Solarwinds < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['COTS'],
              vendor: 'SolarWinds',
              product: 'Serv-U',
              website: 'https://www.solarwinds.com/ftp-server-software',
              description: 'Serv-U - server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Serv-U/i,
                }
              ],
              dynamic_version: ->(x) { _first_header_capture(x, %r{server: Serv-U/([\d.]+)}i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'SolarWinds',
              product: 'Nginx',
              references: ['https://documentation.solarwinds.com/en/success_center/appoptics/content/kb/host_infrastructure/integrations/nginx.htm'],
              description: 'solarwinds nginx server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: solarwinds-nginx/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Security],
              vendor: 'SolarWinds',
              product: 'Orion Platform',
              website: 'https://www.solarwinds.com/solutions/orion',
              description: 'solarwinds orion cookie',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /Orion_IsSessionExp=/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Security],
              vendor: 'SolarWinds',
              product: 'Orion Platform',
              website: 'https://www.solarwinds.com/solutions/orion',
              description: 'solarwinds worldwide string',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{SolarWinds Worldwide, LLC. All Rights Reserved.</div>},
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Security],
              vendor: 'SolarWinds',
              product: 'Orion Platform',
              website: 'https://www.solarwinds.com/solutions/orion',
              description: 'solarwinds version string',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Orion Platform ([\d.]+\ ?[a-zA-z0-9]{3}?)/i,
                }
              ],
              dynamic_version: ->(x) { _first_body_capture(x, /Orion Platform ([\d.]+\ ?[a-zA-z0-9]{3}?)/i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Security],
              vendor: 'SolarWinds',
              product: 'Orion Platform',
              website: 'https://www.solarwinds.com/solutions/orion',
              description: 'solarwinds version string',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Orion Core ([\d.]+\ ?[a-zA-z0-9]{3}?)/i,
                }
              ],
              dynamic_version: ->(x) { _first_body_capture(x, /Orion Core ([\d.]+\ ?[a-zA-z0-9]{3}?)/i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
