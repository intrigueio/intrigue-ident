module Intrigue
  module Ident
    module Check
      module Private
        class Alibaba < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Storage"],
                :vendor => "Alibaba Cloud",
                :product => "Object Storage Service",
                :website => "https://www.alibabacloud.com/product/oss",
                :match_details => "Alibaba Cloud Object Storage Service server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ AliyunOSS$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Email"],
                :vendor => "Alibaba Cloud",
                :product => "Alibaba Mail",
                :website => "https://www.alibabacloud.com/products/alibaba-mail",
                :match_details => "Alibaba Cloud Mail - alimail_browser_instance Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /alimail_browser_instance=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Email"],
                :vendor => "Alibaba Cloud",
                :product => "Alibaba Mail",
                :website => "https://www.alibabacloud.com/products/alibaba-mail",
                :match_details => "Alibaba Cloud Mail - alimail_session_template_key Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /alimail_session_template_key=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Email"],
                :vendor => "Alibaba Cloud",
                :product => "Alibaba Mail",
                :website => "https://www.alibabacloud.com/products/alibaba-mail",
                :match_details => "Alibaba Cloud Mail - alimail_sid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /alimail_sid=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Email"],
                :vendor => "Alibaba Cloud",
                :product => "Alibaba Mail",
                :website => "https://www.alibabacloud.com/products/alibaba-mail",
                :match_details => "Alibaba Cloud Mail - alimail_sso_device_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /alimail_sso_device_id=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://usmailsso.mxhichina.com:443"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Email"],
                :vendor => "Alibaba Cloud",
                :product => "Alibaba Mail",
                :website => "https://www.alibabacloud.com/products/alibaba-mail",
                :match_details => "Alibaba Cloud Mail - alimail_sso_td Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /alimail_sso_td=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://usmailsso.mxhichina.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
