module Intrigue
  module Ident
    module Check
      module Private
        class Zyxel < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "WAF"],
                :vendor => "Zyxel",
                :product => "ZyWALL Business Firewall",
                :website => "https://www.zyxel.com/uk/en/products_services/Business-Firewall-ZyWALL-110-310-1100/",
                :match_details => "Zyxel ZyWALL Business Firewall - zy_pc_browser Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /zy_pc_browser=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Panel"],
                :vendor => "Zyxel",
                :product => "Zyxel",
                :website => "https://www.zyxel.com/uk/en/products_services/smb.shtml?t=s",
                :match_details => "Zyxel Login Panel Match",
                :version => nil,
                :match_type => :content_body,
                :match_content => /fix_cmsg_cont()/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Appliance"],
                :vendor => "Zyxel",
                :dynamic_product => lambda { |x|
                  _first_body_capture(x, /<title>(.*)<\/title>/i)
                },
                :website => "https://www.zyxel.com/uk/en/products_services/smb.shtml?t=s",
                :match_details => "Zyxel Product Match",
                :version => nil,
                :match_type => :content_body,
                :match_content => /fix_cmsg_cont()/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :require_vendor => "Zyxel"
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Appliance"],
                :vendor => "Zyxel",
                :website => "https://www.zyxel.com/uk/en/products_services/smb.shtml?t=s",
                :match_details => "Zyxel Javascript Product Specification",
                :product => "Zyxel",
                :dynamic_product => lambda { |x|
                  _first_body_capture(x, /ZLDSYSPARM_PRODUCT_NAME1="(.*)"/i)
                },
                :match_type => :content_body,
                :match_content => /ZLDSYSPARM_PRODUCT_NAME1/,
                :hide => false,
                :paths => [{ :path => "#{url}/ext-js/app/common/zld_product_spec.js", :follow_redirects => true }],
                :inference => false,
                :require_vendor => "Zyxel"
              }
            ]
          end
        end
      end
    end
  end
end
