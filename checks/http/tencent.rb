module Intrigue
  module Ident
    module Check
      module Private
        class Tencent < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social", "SaaS"],
                :vendor => "Tencent",
                :product => "Government Wechat",
                :website => "https://work.weixin.qq.com/server",
                :match_details => "Tencent Government Wechat - wwrtx.i18n_lan Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /wwrtx.i18n_lan=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://gov.weixin.qq.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social", "SaaS"],
                :vendor => "Tencent",
                :product => "Government Wechat",
                :website => "https://work.weixin.qq.com/server",
                :match_details => "Tencent Government Wechat - wwrtx.c_gdpr Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /wwrtx.c_gdpr=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://gov.weixin.qq.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social", "SaaS"],
                :vendor => "Tencent",
                :product => "Government Wechat",
                :website => "https://work.weixin.qq.com/server",
                :match_details => "Tencent Government Wechat - ww_rtkey Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /ww_rtkey=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://gov.weixin.qq.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social", "SaaS"],
                :vendor => "Tencent",
                :product => "Government Wechat",
                :website => "https://work.weixin.qq.com/server",
                :match_details => "Tencent Government Wechat - wwrtx.ref Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /wwrtx.ref=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://gov.weixin.qq.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social", "SaaS"],
                :vendor => "Tencent",
                :product => "Government Wechat",
                :website => "https://work.weixin.qq.com/server",
                :match_details => "Tencent Government Wechat - wwrtx.refid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /wwrtx.refid=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://gov.weixin.qq.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
