module Intrigue
  module Ident
    module Check
      class Segment < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[JavaScript SaaS APM],
              vendor: 'Segment',
              product: 'Segment',
              website: 'https://segment.com/',
              description: 'segment js',
              version: nil,
              match_type: :content_body,
              match_content: %r{cdn.segment.com/analytics.js}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
