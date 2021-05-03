module Intrigue
  module Ident
    module Check
      class HikVision < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[IoT Firmware WebServer],
              vendor: 'HikVision',
              product: 'DNVRS',
              references: ['https://www.hikvision.com/en/products/Turbo-HD-Products/Turbo-HD-Cameras/IOT-Series/'],
              version: nil,
              description: 'HikVision DNVRS - Server Header',
              match_type: :content_headers,
              match_content: /^server:\ DNVRS-Webs$/i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^server:\ DNVRS-Webs$/i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
