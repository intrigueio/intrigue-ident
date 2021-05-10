module Intrigue
  module Ident
    module Check
      class Webmin < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Login Panel'],
              vendor: 'Webmin',
              product: 'Webmin',
              website: 'https://www.webmin.com/',
              description: 'page title',
              match_type: :content_body,
              match_content: /<title>Login to Webmin/,
              version: nil,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: MiniServ/(.*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Login Panel'],
              vendor: 'Usermin',
              product: 'Usermin',
              website: 'https://www.webmin.com/usermin.html',
              description: 'page title',
              match_type: :content_body,
              match_content: /<title>Login to Usermin/,
              version: nil,
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{server: MiniServ/(.*)}i)
              },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issue: 'exposed_admin_panel_unauthenticated'
            }
          ]
        end
      end
    end
  end
end
