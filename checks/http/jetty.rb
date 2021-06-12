module Intrigue
  module Ident
    module Check
      class Jetty < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[CMS SaaS],
              vendor: 'Jetty',
              product: 'Communication Management System',
              website: 'https://jettyapp.com/',
              description: 'unique body string',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{title="Jetty">Proudly powered by Jetty</a>}i,
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
