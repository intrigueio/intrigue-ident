module Intrigue
  module Ident
    module Check
      class F5 < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Networking', 'Load Balancer', 'Login Panel'],
              vendor: 'F5',
              product: 'BIG-IP Access Policy Manager',
              website: 'https://www.f5.com/products/security/access-policy-manager',
              description: 'F5 BIG-IP Access Policy Manager default cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /MRHSession/,
                },
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Networking', 'Load Balancer', 'Admin Panel'],
              vendor: 'F5',
              product: 'BIG-IP Access Policy Manager',
              description: 'F5 BIG-IP APM default logo',
              version: nil,
              references: ['https://support.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-customization-11-6-0/3.html'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<img src="/public/images/my/tr.gif/},
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking WAF],
              vendor: 'F5',
              product: 'BIG-IP Application Security Manager',
              description: 'TS cookie',
              version: '10.0.0 through 11.3.0',
              references: ['https://support.f5.com/csp/article/K6850',
                           'https://devcentral.f5.com/s/articles/the-big-ip-application-security-manager-part-1-what-is-the-asm'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /TS[0-9a-f]{6}_[0-9a-f]=/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking WAF],
              vendor: 'F5',
              product: 'BIG-IP Application Security Manager',
              description: 'TS cookie',
              version: '11.4.0 through 13.x',
              references: ['https://support.f5.com/csp/article/K6850',
                           'https://devcentral.f5.com/s/articles/the-big-ip-application-security-manager-part-1-what-is-the-asm'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /TS[0-9a-f]{7}_[0-9a-f]=/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking WAF],
              vendor: 'F5',
              product: 'BIG-IP Application Security Manager',
              description: 'TS cookie',
              version: '14.0.0 and later',
              references: ['https://support.f5.com/csp/article/K6850',
                           'https://devcentral.f5.com/s/articles/the-big-ip-application-security-manager-part-1-what-is-the-asm'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /TS[0-9a-f]{7}[0-9a-f]=/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: ['Networking', 'Load Balancer'],
              vendor: 'F5',
              product: 'BIG-IP Local Traffic Manager',
              website: 'https://www.f5.com/products/big-ip-services/local-traffic-manager',
              description: 'F5 BIG-IP Load balancer cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /BIGipServer/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: ['Networking', 'Load Balancer'],
              vendor: 'F5',
              product: 'BIG-IP Local Traffic Manager',
              website: 'https://www.f5.com/products/big-ip-services/local-traffic-manager',
              description: 'F5 BIG-IP Load balancer header',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^server: BigIP$/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Networking', 'Load Balancer'],
              vendor: 'F5',
              product: 'BIG-IP Configuration Utility',
              description: 'redirect to config util',
              references: ['https://twitter.com/n0x08/status/1278812795031523328'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /BIG-IP&reg;- Redirect/,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issues: ['exposed_bigip_configuration_utility']
            }
          ]
        end
      end
    end
  end
end
