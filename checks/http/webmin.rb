module Intrigue
  module Ident
    module Check
      class Webmin < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['WebServer'],
              vendor: 'Webmin',
              product: 'Webmin',
              description: 'miniserv server',
              match_type: :content_headers,
              references: [],
              match_content: /server: MiniServ/i,
              version: nil,
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{server: MiniServ/(.*)}i)
                               },
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Admin Panel'],
              vendor: 'Webmin',
              product: 'Webmin',
              description: 'page title',
              match_type: :content_body,
              references: [],
              match_content: /<title>Login to Webmin/,
              version: nil,
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
