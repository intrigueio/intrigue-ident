module Intrigue
  module Ident
    module Check
      class Neustar < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[WAF SaaS],
              vendor: 'Neustar',
              product: 'UltraDNS',
              references: ['https://www.home.neustar/application-security'],
              version: nil,
              description: 'Neustar UltraDNS - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^Server:\ UltraDNS\ Client\ Redirection\ Server$/i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, /^Server:\ UltraDNS\ Client\ Redirection\ Server$/i)
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
