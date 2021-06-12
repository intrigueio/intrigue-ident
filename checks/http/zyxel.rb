module Intrigue
  module Ident
    module Check
      module Private
        class Zyxel < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                type: 'fingerprint',
                category: 'service',
                tags: ['Cloud', 'WAF'],
                vendor: 'Zyxel',
                product: 'ZyWALL Business Firewall',
                website: 'https://www.zyxel.com/uk/en/products_services/Business-Firewall-ZyWALL-110-310-1100/',
                description: 'Zyxel ZyWALL Business Firewall - zy_pc_browser Cookie Match',
                version: nil,
                match_logic: :all,
                matches: [
                  {
                    match_type: :content_cookies,
                    match_content: /zy_pc_browser=/i,
                  }
                ],
                hide: false,
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Login Panel'],
                vendor: 'Zyxel',
                product: 'Zyxel',
                website: 'https://www.zyxel.com/uk/en/products_services/smb.shtml?t=s',
                description: 'Zyxel Login Panel Match',
                version: nil,
                match_logic: :all,
                matches: [
                  {
                    match_type: :content_body,
                    match_content: /fix_cmsg_cont()/,
                  }
                ],
                hide: false,
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Appliance'],
                vendor: 'Zyxel',
                product: 'Zyxel',
                dynamic_product: lambda { |x|
                  _first_body_capture(x, %r{<title>(.*)</title>}i)
                },
                website: 'https://www.zyxel.com/uk/en/products_services/smb.shtml?t=s',
                description: 'Zyxel Product Match',
                version: nil,
                match_logic: :all,
                matches: [
                  {
                    match_type: :content_body,
                    match_content: /fix_cmsg_cont()/,
                  }
                ],
                hide: false,
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false,
                require_vendor: 'Zyxel'
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Appliance'],
                vendor: 'Zyxel',
                website: 'https://www.zyxel.com/uk/en/products_services/smb.shtml?t=s',
                description: 'Zyxel JavaScript Product Specification',
                product: 'Zyxel',
                match_logic: :all,
                matches: [
                  {
                    match_type: :content_body,
                    match_content: /ZLDSYSPARM_PRODUCT_NAME1/,
                  }
                ],
                dynamic_product: lambda { |x|
                  _first_body_capture(x, /ZLDSYSPARM_PRODUCT_NAME1="(.*)"/i)
                },
                hide: false,
                paths: [{ path: "#{url}/ext-js/app/common/zld_product_spec.js", follow_redirects: true }],
                inference: false,
                require_vendor: 'Zyxel'
              }
            ]
          end
        end
      end
    end
  end
end
