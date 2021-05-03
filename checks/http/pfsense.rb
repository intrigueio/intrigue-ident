module Intrigue
  module Ident
    module Check
      class Pfsense < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Firewall'],
              vendor: 'pfSense',
              product: 'pfSense',
              website: 'https://www.pfsense.org/',
              description: 'unique body content',
              version: nil,
              match_type: :content_body,
              match_content: /Login to pfSense/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
