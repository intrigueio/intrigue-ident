module Intrigue
  module Ident
    module Check
      class Envoy < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking Proxy],
              vendor: 'Envoy',
              product: 'Envoy',
              website: 'https://www.envoyproxy.io/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: envoy$/,
                }
              ],
              description: 'server header',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
