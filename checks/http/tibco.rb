module Intrigue
  module Ident
    module Check
      class Tibco < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            { # check for jaasperreports when you see apache
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              description: 'login page title',
              website: 'https://www.jaspersoft.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<title>TIBCO Jaspersoft: Login</title>}i,
                }
              ],
              paths: [{ path: "#{url}/jasperserver/login.html", follow_redirects: true }],
              require_product: 'HTTP Server', # require apache
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            { # check for jaasperreports when you see nginx
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Panel],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              description: 'login page title',
              website: 'https://www.jaspersoft.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<title>TIBCO Jaspersoft: Login</title>}i,
                }
              ],
              paths: [{ path: "#{url}/jasperserver/login.html", follow_redirects: true }],
              require_product: 'Nginx', # require nginx
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            { # check for jaasperreports PRO when you see apache
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Panel],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              website: 'https://www.jaspersoft.com/',
              description: 'login page title (Professional Edition)',
              version: nil,
              match_logic: :all,
              matches: [
              
              ],
              paths: [{ path: "#{url}/jasperserver-pro/login.html", follow_redirects: true }],
              require_product: 'HTTP Server', # require apache
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            { # check for jaasperreports PRO when you see nginx
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Panel],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              website: 'https://www.jaspersoft.com/',
              description: 'login page title (Professional Edition)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<title>TIBCO Jaspersoft: Login</title>}i,
                }
              ],
              paths: [{ path: "#{url}/jasperserver-pro/login.html", follow_redirects: true }],
              require_product: 'Nginx', # require nginx
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Panel],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              website: 'https://www.jaspersoft.com/',
              description: 'location header (Professional Edition)',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^Location: /jasperserver-pro$}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: false }],
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              website: 'https://www.jaspersoft.com/',
              description: 'TIBCO JasperReports Server - Body Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{src="/jasperserver/scripts/jasperserver\.js}i,
                },
                {
                  match_type: :content_body,
                  match_content: %r{<title>TIBCO Jaspersoft: Login</title>}i,
                },
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development'],
              vendor: 'TIBCO',
              product: 'JasperReports Server',
              website: 'https://www.jaspersoft.com/',
              description: 'jasperserver-pro cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: %r{Path=/jasperserver-pro/}i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issues: ['exposed_jaspersoft_panel']
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['API'],
              vendor: 'TIBCO',
              product: 'Mashery',
              website: 'https://www.tibco.com/products/api-management',
              description: 'TIBCO Mashery - Headers Match',
              version: nil,
              match_logic: :any,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: Mashery Proxy$/i,
                },
                {
                  match_type: :content_headers,
                  match_content: /^x-mashery-error-code:.*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[Analytics COTS],
              vendor: 'TIBCO',
              product: 'Spotfire Server',
              website: 'https://www.tibco.com/products/tibco-spotfire',
              description: 'server header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: TIBCO Spotfire Server$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
