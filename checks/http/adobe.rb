module Intrigue
  module Ident
    module Check
      class Adobe < Intrigue::Ident::Check::Base
        ###
        ### Handy: Metasploit: /modules/auxiliary/scanner/http/coldfusion_version.rb
        ###

        def generate_checks(url)
          [
            # TODO, put more work into finding coldfusion on the front page...
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'Application Server'],
              vendor: 'Adobe',
              product: 'Coldfusion',
              website: 'https://coldfusion.adobe.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /CFTOKEN=/,
                }
              ],
              description: 'Adobe Coldfusion Cookie Match',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            { # Coldfusion
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'Application Server'],
              vendor: 'Adobe',
              product: 'Coldfusion',
              website: 'https://coldfusion.adobe.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="Author" content="Copyright \(c\) 1995-2010 Adobe/,
                }
              ],
              description: 'body content',
              hide: false,
              paths: [{ path: "#{url}/CFIDE/administrator/index.cfm", follow_redirects: true }],
              require_product: 'Coldfusion',
              inference: false,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            { # Coldfusion 6, 7
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'Application Server'],
              vendor: 'Adobe',
              references: [
                'https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/http/coldfusion_version.rb'
              ],
              product: 'Coldfusion',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: %r{>\s*Version:\s.*</strong><br\s/},
                }
              ],
              dynamic_version: lambda { |x|
                                 version = _first_body_capture(x, %r{>\s*Version:\s*(.*)</strong><br\s/})
                                 version =~ /^6/ ? "MX6 #{x}" : "MX7 #{x}"
                               },
              description: 'Body content, version string',
              hide: false,
              paths: [{ path: "#{url}/CFIDE/administrator/index.cfm", follow_redirects: true }],
              require_product: 'Coldfusion',
              inference: true,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            { # Coldfusion 10 ... this needs OR/AND ?
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'Application Server'],
              vendor: 'Adobe',
              product: 'Coldfusion',
              website: 'https://coldfusion.adobe.com/',
              version: '10',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="Author" content="Copyright \(c\) 1995-2010 Adobe.*1997-2012 Adobe Systems Incorporated and its licensors/m,
                }
              ],
              description: 'body content',
              hide: false,
              paths: [{ path: "#{url}/CFIDE/administrator/index.cfm", follow_redirects: true }],
              require_product: 'Coldfusion',
              inference: true,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            { # Coldfusion 11 ... this needs OR/AND ?
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'Application Server'],
              vendor: 'Adobe',
              product: 'Coldfusion',
              website: 'https://coldfusion.adobe.com/',
              version: '11',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /&copy; 1997 - 2014 Adobe Systems Incorporated and its licensors/m,
                }
              ],
              description: 'body content',
              hide: false,
              paths: [{ path: "#{url}/CFIDE/administrator/index.cfm", follow_redirects: true }],
              require_product: 'Coldfusion',
              inference: true,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            #
            { # Generic check
              type: 'fingerprint',
              category: 'application',
              tags: ['Development', 'Application Server'],
              vendor: 'Adobe',
              product: 'Coldfusion',
              website: 'https://coldfusion.adobe.com/',
              version: nil,
              dynamic_version: lambda { |x|
                                 _first_body_capture(x, /<meta name="Keywords" content="(.*)">\s+<meta name/)
                               },
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<meta name="Keywords" content=".*">\s+<meta name/,
                }
              ],
              description: 'body content',
              hide: false,
              paths: [{ path: "#{url}/CFIDE/administrator/index.cfm", follow_redirects: true }],
              require_product: 'Coldfusion',
              inference: true,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[CMS Marketing],
              vendor: 'Adobe',
              product: 'Experience Manager',
              website: 'https://business.adobe.com/uk/products/experience-manager/adobe-experience-manager.html',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{src="/etc/clientlibs/},
                }
              ],
              description: 'unique path',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[CMS Marketing],
              vendor: 'Adobe',
              product: 'Experience Manager',
              website: 'https://business.adobe.com/uk/products/experience-manager/adobe-experience-manager.html',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{srcset="/content/dam/},
                }
              ],
              description: 'unique path',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[CMS Editor],
              vendor: 'Adobe',
              product: 'Fireworks MX',
              website: 'https://www.adobe.com/uk/products/fireworks.html',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /Fireworks MX Dreamweaver MX/,
                }
              ],
              description: 'generator string in the body',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[CMS Marketing SaaS],
              vendor: 'Adobe',
              product: 'Omniture DC',
              website: 'https://my.omniture.com/login/',
              version: nil,
              dynamic_version: ->(x) { _first_header_capture(x, %r{server: Omniture DC/(.*)}) },
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Omniture DC/,
                }
              ],
              description: 'Omniture server header',
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
