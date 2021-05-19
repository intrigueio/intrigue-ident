module Intrigue
  module Ident
    module Check
      class DOSarrest < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CDN WAF],
              vendor: 'DOSarrest',
              product: 'DOSarrest',
              references: ['https://www.dosarrest.com/'],
              version: nil,
              description: 'DOSarrest - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server:.*DOSarrest/i,
                }
              ],
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
