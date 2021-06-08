module Intrigue
  module Ident
    module Check
      class RedHat < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            { # The requested URL /doesntexist-123 was not found on this server.</p>\n<hr>\n
              # <address>Apache/2.2.15 (Red Hat) Server at jasper.emory.edu Port 443</address>
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['OS'],
              vendor: 'RedHat',
              product: 'Linux',
              website: 'https://www.redhat.com/',
              description: 'apache error page',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Apache.* \(Red Hat\) Server.*/i,
                }
              ],
              paths: [{ path: "#{url}/doesntexist-123", follow_redirects: true }],
              inference: false
            },
            { # server: Apache/2.4.6 (Red Hat Enterprise Linux) OpenSSL/1.0.2k-fips PHP/7.2.12
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['OS'],
              vendor: 'RedHat',
              product: 'Enterprise Linux',
              website: 'https://www.redhat.com/',
              description: 'nginx test page',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^Apache.* \(Red Hat Enterprise Linux\).*$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: ['OS', "DefaultPage"],
              vendor: 'RedHat',
              product: 'Fedora Linux',
              website: 'https://getfedora.org/',
              description: 'nginx test page',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Test Page for the Nginx HTTP Server on Fedora$/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Administrative Hypervisor],
              vendor: 'RedHat',
              product: 'OpenShift Container Platform',
              description: 'error message in html',
              references: ['https://bugzilla.redhat.com/show_bug.cgi?id=1414657'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Route and path matches, but all pods are down./i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Development Administrative Hypervisor],
              vendor: 'RedHat',
              product: 'OpenShift Container Platform',
              description: 'title',
              website: 'https://www.openshift.com/products/container-platform',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Login - OpenShift Origin/i,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'RedHat',
              product: 'JBoss Core Services',
              references: ['https://www.redhat.com/en/resources/jboss-core-services-collection-datasheet'],
              version: nil,
              description: 'RedHat JBoss Core Services - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^Server:\ JBCS\ httpd/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, %r{^Server:\ JBCS\ httpd/(\d+(\.\d+)*)}i)
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'RedHat',
              product: 'JBoss Enterprise Application Platform',
              website: 'https://www.redhat.com/en/technologies/jboss-middleware/application-platform',
              version: nil,
              description: 'powered by header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by:.*JBoss/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^x-powered-by:.*JBoss-(\d+(.\d+)*)/i)
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'RedHat',
              product: 'JBoss Enterprise Application Platform',
              description: 'powered by header',
              references: ['https://bugzilla.redhat.com/show_bug.cgi?id=1049103'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^X-Powered-By: JSP/2.}i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Web Server'],
              vendor: 'RedHat',
              product: 'JBoss Web Server',
              description: 'powered by header',
              references: ['https://www.redhat.com/en/technologies/jboss-middleware/web-server'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^x-powered-by:.*JBossWeb-[\d.]+$/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^x-powered-by:.*JBossWeb-([\d.]+)$/i)
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
