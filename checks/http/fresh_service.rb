module Intrigue
  module Ident
    module Check
      class FreshService < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Support SaaS],
              vendor: 'FreshService',
              product: 'FreshService',
              website: 'https://freshservice.com/',
              description: 'missing helpdesk (title)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^There is no helpdesk here!$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              hide: true,
              inference: false
            }
          ]
        end
      end
    end
  end
end
