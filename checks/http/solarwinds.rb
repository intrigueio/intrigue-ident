module Intrigue
  module Ident
    module Check
      class Solarwinds < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS"],
              vendor: "SolarWinds",
              product: "Serv-U",
              description: "Serv-U - server header",
              version: nil,
              match_type: :content_headers,
              match_content: /server: Serv-U/i,
              dynamic_version: lambda { |x| _first_header_capture(x, /server: Serv-U\/([\d\.]+)/i) },
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["WebServer"],
              vendor: "SolarWinds",
              product: "Nginx",
              description: "solarwinds nginx server header",
              version: nil,
              match_type: :content_headers,
              match_content: /server: solarwinds-nginx/i,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS", "Network", "Security"],
              vendor: "SolarWinds",
              product: "Orion Platform",
              description: "solarwinds orion cookie",
              match_type: :content_cookies,
              match_content: /Orion_IsSessionExp=/i,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS", "Network", "Security"],
              vendor: "SolarWinds",
              product: "Orion Platform",
              description: "solarwinds worldwide string",
              match_type: :content_body,
              match_content: /SolarWinds Worldwide, LLC. All Rights Reserved.<\/div>/,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS", "Network", "Security"],
              vendor: "SolarWinds",
              product: "Orion Platform",
              description: "solarwinds version string",
              match_type: :content_body,
              match_content: /Orion Platform ([\d\.]+\ ?[a-zA-z0-9]{3}?)/i,
              dynamic_version: lambda { |x| _first_body_capture(x, /Orion Platform ([\d\.]+\ ?[a-zA-z0-9]{3}?)/i) },
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS", "Network", "Security"],
              vendor: "SolarWinds",
              product: "Orion Platform",
              description: "solarwinds version string",
              match_type: :content_body,
              match_content: /Orion Core ([\d\.]+\ ?[a-zA-z0-9]{3}?)/i,
              dynamic_version: lambda { |x| _first_body_capture(x, /Orion Core ([\d\.]+\ ?[a-zA-z0-9]{3}?)/i) },
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: true,
            },
          ]
        end
      end
    end
  end
end
