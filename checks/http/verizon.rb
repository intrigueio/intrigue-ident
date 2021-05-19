module Intrigue
  module Ident
    module Check
      class Verizon < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF],
              vendor: 'Verizon',
              product: 'Edgecast',
              website: 'https://www.verizondigitalmedia.com/media-platform/delivery/network/',
              description: 'unique header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /ECD \(.*?\)/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
