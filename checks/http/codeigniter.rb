module Intrigue
  module Ident
    module Check
      class CodeIgniter < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server', 'Embedded', 'Web Framework'],
              vendor: 'CodeIgniter',
              product: 'CodeIgniter',
              website: 'https://codeigniter.com/',
              version: nil,
              match_type: :content_title,
              match_content: /Welcome to CodeIgniter/,
              description: 'page title',
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
