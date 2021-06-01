module Intrigue
  module Ident
    module Check
      class Github < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development SaaS],
              vendor: 'Github',
              product: 'Github',
              website: 'https://github.com/',
              description: 'Github - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-github-request-id:.*$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^server: GitHub.com$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
          ]
        end
      end
    end
  end
end
