module Intrigue
  module Ident
    module Check
      class Netscape < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'Netscape',
              product: 'Enterprise Server',
              website: 'http://isp.netscape.com/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /Server: Netscape-Enterprise.*/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{Server: Netscape-Enterprise/([\d.]*).*}i)
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
