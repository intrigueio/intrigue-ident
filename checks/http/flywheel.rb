module Intrigue
  module Ident
    module Check
      class Flywheel < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['CMS', 'SaaS', 'PaaS'],
              vendor: 'Flywheel',
              product: 'Hosted Wordpress',
              references: [
                'https://getflywheel.com/wordpress-support/a-description-of-the-flywheel-technology-stack/'
              ],
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server: Flywheel/[\d.]+$}i,
                }
              ],
              dynamic_version: ->(d) { _first_header_capture(d, %r{^server: Flywheel/([\d.]+)$}i) },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
