module Intrigue
  module Ident
    module Check
      class Centreon < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Monitoring Security],
              vendor: 'Centreon',
              product: 'Centreon',
              website: 'https://www.centreon.com/',
              description: 'body content',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /mailto:contact@centreon.com/i,
                }
              ],
              dynamic_version: ->(x) { _first_body_capture(x, /v. (\d{0,3}\.\d{0,3}\.\d{0,3})/) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
