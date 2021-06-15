module Intrigue
  module Ident
    module Check
      class Tengine < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Taobao',
              product: 'Tengine',
              references: ['https://tengine.taobao.org/'],
              version: nil,
              description: 'Taobao Tengine - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:\ Tengine/{0,1}(\d{1,}\.\d{1,}\.\d{1,}){0,1}|Aserver$}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x,
                                                       %r{^server:\ Tengine/{0,1}(\d{1,}\.\d{1,}\.\d{1,}){0,1}|Aserver$}i)
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
