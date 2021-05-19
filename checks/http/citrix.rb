module Intrigue
  module Ident
    module Check
      class Citrix < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'Access Gateway',
              description: 'login page',
              version: nil,
              website: 'https://www.citrix.com/downloads/citrix-gateway/access-gateway.html',
              references: ['https://www.citrix.com/content/dam/citrix/en_us/documents/downloads/netscaler-access-gateway/Citrix_Access_Gateway_Spec_Sheet.pdf'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Citrix Access Gateway$/i,
                }
              ],
              hide: false,
              require_product: 'NetScaler Gateway',
              paths: [{ path: "#{url}/vpn/tmindex.html", follow_redirects: true }],
              inference: false,
              issues: ['exposed_citrix_adc_management_interface']
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway (Management Interface)',
              website: 'https://www.citrix.com/',
              description: 'adc management interface',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^Application Delivery Management$/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issues: ['exposed_citrix_adc_management_interface']
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              description: 'title',
              website: 'https://www.citrix.com/',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Citrix Gateway/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              description: 'title',
              website: 'https://www.citrix.com/',
              references: ['https://support.citrix.com/article/CTX124630'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /NSC_[\w\d]+_[\w\d]+=/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: 'logonpoint',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /_ctxstxt_CitrixCopyright/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: 'title',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /NetScaler Gateway/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: 'NSC_TMAC cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /NSC_TMAC=/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: 'NSC_TEMP cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /NSC_TEMP=/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: 'NSC_.*_NGB cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /NSC_\w+_NGB=/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: 'NSC_PERS cookie',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /NSC_PERS=/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              website: 'https://www.citrix.com/en-gb/downloads/citrix-gateway/netscaler-gateway-121.html',
              description: '(often) customized logon page - netscaler gateway',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /CTXMSAM_LogonFont/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              description: 'misspelled content-length header',
              references: ['https://support.citrix.com/article/CTX211605'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /^cteonnt-length:.*$/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              description: 'cookie',
              references: ['https://support.citrix.com/article/CTX131488'],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: /citrix_ns_id=/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              description: 'redirect',
              references: ['https://support.citrix.com/article/CTX131488'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^location: /vpn/index\.html$}i,
                }
              ],
              hide: false,
              paths: [{ path: "#{url}/doesntexist-123", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'operating_system',
              tags: %w[Networking COTS VPN],
              vendor: 'Citrix',
              product: 'NetScaler Gateway',
              description: 'cookie',
              references: ['https://www.citrix.com/content/dam/citrix/en_us/documents/products-solutions/citrix-xenmobile-technology-overview.pdf'],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_cookies,
                  match_content: %r{NSC_TASS=/doesntexist-123/vpn/index\.html}i,
                }
              ],
              hide: false,
              paths: [{ path: "#{url}/doesntexist-123", follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS MDM],
              vendor: 'Citrix',
              product: 'XenMobile',
              website: 'https://www.citrix.com/products/citrix-endpoint-management/',
              description: 'redirect',
              references: [],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^location: /zdm/login_xdm_uc.jsp$}i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            { # <div class="info_version">XenMobile version&nbsp;</div>
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS MDM],
              vendor: 'Citrix',
              product: 'XenMobile',
              website: 'https://www.citrix.com/products/citrix-endpoint-management/',
              description: 'redirect',
              references: [],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /^XenMobile - Console - Logon$/i,
                }
              ],
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS Hypervisor],
              vendor: 'Citrix',
              product: 'XenServer',
              website: 'https://www.citrix.com/en-gb/products/citrix-hypervisor/',
              description: 'page title',
              references: [],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<title>XenServer/,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<title>XenServer (.*?)</title>})
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              vendor: 'Citrix',
              tags: %w[Networking COTS Hypervisor],
              product: 'XenServer',
              website: 'https://www.citrix.com/en-gb/products/citrix-hypervisor/',
              description: 'page title',
              references: [],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /<title>Welcome to Citrix XenServer/,
                }
              ],
              dynamic_version: lambda { |x|
                _first_body_capture(x, %r{<title>Welcome to Citrix XenServer (.*?)</title>})
              },
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              vendor: 'Citrix',
              tags: ['Networking', 'COTS', 'Application Server'],
              product: 'ShareFile',
              website: 'https://www.sharefile.com/',
              description: 'page title',
              references: [],
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: %r{<title>ShareFile Storage Server</title>},
                }
              ],
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
