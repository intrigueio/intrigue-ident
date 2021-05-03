module Intrigue
  module Ident
    module Check
      class RuckusWireless < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS Administrative],
              vendor: 'Ruckus Wireless',
              product: 'Admin',
              website: 'https://www.commscope.com/ruckus/',
              description: 'login page for ruckus wireless device',
              match_type: :content_title,
              match_content: /Ruckus Wireless Admin/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
