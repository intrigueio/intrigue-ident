module Intrigue
  module Ident
    module Check
      class InsideSales < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[SaaS Marketing],
              vendor: 'InsideSales.com',
              product: 'InsideSales.com',
              website: 'https://uk.insidesales.com/',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: Insidesales.com$/i,
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
