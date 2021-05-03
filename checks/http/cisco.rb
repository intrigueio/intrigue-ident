module Intrigue
  module Ident
    module Check
      class Cisco < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS VPN Firewall],
              vendor: 'Cisco',
              product: 'Adaptive Security Appliance Device Manager',
              website: 'https://www.cisco.com/c/en/us/products/security/adaptive-security-device-manager/index.html',
              description: 'page title',
              version: nil,
              dynamic_version: ->(x) { _first_body_capture(x, %r{<title>Cisco ASDM (.*?)</title>}) },
              match_type: :content_body,
              match_content: /<title>Cisco ASDM/i,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: %w[Networking COTS],
              vendor: 'Cisco',
              product: 'Email Security Appliance',
              website: 'https://www.cisco.com/c/en_uk/products/security/email-security/index.html',
              description: 'page title',
              version: nil,
              dynamic_version: lambda { |x|
                _first_body_capture(x, /Email Security Appliance   (.*?) \(/i)
              },
              match_type: :content_body,
              match_content: /<title>[\s\t]+Cisco[\s\t]+Email Security Appliance/,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: %w[Networking COTS],
              vendor: 'Cisco',
              product: 'Expressway',
              references: [
                'https://www.cisco.com/c/en/us/products/unified-communications/expressway-series/index.html',
                'https://www.cisco.com/c/dam/en/us/td/docs/voice_ip_comm/expressway/admin_guide/Cisco-Expressway-Administrator-Guide-X8-10.pdf'
              ],
              description: 'server header',
              version: nil,
              match_type: :content_headers,
              match_content: /^server: CE_E$/i,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'hardware',
              tags: %w[Networking COTS Firewall Wireless],
              vendor: 'Cisco',
              product: 'Meraki',
              website: 'https://meraki.cisco.com/en-uk/',
              description: 'Meraki logo on an on-prem box',
              version: nil,
              match_type: :content_body,
              match_content: %r{<img id="header_logo" src="images/meraki-logo.png"}i,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS VPN],
              vendor: 'Cisco',
              product: 'Adaptive Security Appliance Software',
              website: 'https://www.cisco.com/c/en_uk/products/security/adaptive-security-appliance-asa-software/index.html',
              description: 'Cisco SSL VPN',
              version: nil,
              match_type: :content_cookies,
              match_content: /webvpn/i,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS VPN],
              vendor: 'Cisco',
              product: 'Adaptive Security Appliance Software',
              website: 'https://www.cisco.com/c/en_uk/products/security/adaptive-security-appliance-asa-software/index.html',
              description: 'Cisco SSL VPN',
              version: nil,
              match_type: :content_body,
              match_content: %r{<script>document\.location\.replace\('/\+CSCOE\+/logon\.html}i,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS VPN],
              vendor: 'Cisco',
              product: 'IOS',
              website: 'https://www.cisco.com/c/en/us/products/ios-nx-os-software/ios-software-releases-listing.html',
              description: 'Cisco Router',
              version: nil,
              match_type: :content_headers,
              match_content: /server: cisco-IOS/i,
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Networking COTS Hypervisor],
              vendor: 'Cisco',
              product: 'vManage',
              website: 'https://www.cisco.com/c/en_uk/solutions/enterprise-networks/sd-wan/index.html',
              description: 'page title',
              version: nil,
              match_type: :content_body,
              match_content: /<title>Cisco vManage/i,
              hide: false,
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
