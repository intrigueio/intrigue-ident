module Intrigue
  module Ident
    module Check
      class Grafana < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['COTS', 'Development', 'Cloud', 'Analytics'],
              vendor: 'Grafana',
              product: 'Grafana',
              website: 'https://grafana.com/',
              description: 'Grafana - grafana_ses Cookie Match',
              version: nil,
              match_type: :content_cookies,
              match_content: /grafana_ses=/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
