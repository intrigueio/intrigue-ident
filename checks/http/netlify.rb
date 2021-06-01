module Intrigue
  module Ident
    module Check
      class Netlify < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[PaaS CDN],
              vendor: 'Netlify',
              product: 'Netlify',
              website: 'https://www.netlify.com/',
              description: 'Netlify - Headers Match',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Netlify/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-nf-request-id:.*$/i,
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
