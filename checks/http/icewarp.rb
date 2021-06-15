module Intrigue
  module Ident
    module Check
      class IceWarp < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Productivity COTS Email],
              vendor: 'IceWarp',
              product: 'IceWarp',
              references: ['https://www.icewarp.com/'],
              version: nil,
              description: 'IceWarp - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:\ IceWarp/(\d{1,}\.\d{1,}\.\d{1,})$}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server:\ IceWarp/(\d{1,}\.\d{1,}\.\d{1,})$}i)
                               },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
