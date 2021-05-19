module Intrigue
  module Ident
    module Check
      class Zeit < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Framework', 'JavaScript'],
              vendor: 'Zeit',
              product: 'Next.js',
              description: 'x-powered-by header',
              references: ['https://zeit.co/blog/next'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /x-powered-by: Next.js/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /x-powered-by: Next.js\ (.*)/i)
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
