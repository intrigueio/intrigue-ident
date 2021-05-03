module Intrigue
  module Ident
    module Check
      class Intercom < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Javascript Support],
              vendor: 'Intercom',
              product: 'Intercom',
              website: 'https://www.intercom.com/',
              description: 'js load string',
              version: nil,
              match_type: :content_body,
              match_content: /ic=w.Intercom;/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
