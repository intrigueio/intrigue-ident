module Intrigue
  module Ident
    module Check
      class Maginon < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[IoT],
              vendor: 'Maginon',
              product: 'Supra IPC',
              description: 'ip camera',
              references: [
                'https://networktoolbox.de/aldi-medion-rolley-camera-findings/',
                'https://maginon.de/'
              ],
              match_type: :content_headers,
              match_content: %r{^server: mcdhttpd/?.*$}i,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server: mcdhttpd/?(.*)?$}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
