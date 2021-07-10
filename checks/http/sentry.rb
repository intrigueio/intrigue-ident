module Intrigue
  module Ident
    module Check
      class Sentry < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['JavaScript', 'APM'],
              vendor: 'Sentry',
              product: 'Sentry',
              website: 'http://sentry.io/',
              description: 'sentry init js',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Sentry.init\({dsn:/i,
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
