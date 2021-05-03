module Intrigue
  module Ident
    module Check
      class Nagios < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[COTS Administrative Development],
              vendor: 'Nagios',
              product: 'Nagios',
              website: 'https://www.nagios.org/',
              description: 'Nagios',
              version: nil,
              match_type: :content_headers,
              match_content: /nagios/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
