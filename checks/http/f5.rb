module Intrigue
module Ident
module Check
  class F5 < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Networking", "Load Balancer"],
          :vendor => "F5",
          :product =>"BIG-IP Access Policy Manager",
          :match_details =>"F5 BIG-IP Access Policy Manager default cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content => /MRHSession/,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Networking", "Load Balancer"],
          :vendor => "F5",
          :product =>"BIG-IP Access Policy Manager",
          :match_details =>"F5 BIG-IP APM default logo",
          :version => nil,
          :references => ["https://support.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-customization-11-6-0/3.html"],
          :match_type => :content_body,
          :match_content => /<img src="\/public\/images\/my\/tr.gif\//,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Networking", "WAF"],
          :vendor => "F5",
          :product =>"BIG-IP Application Security Manager",
          :match_details =>"TS cookie",
          :version => "10.0.0 through 11.3.0",
          :references => ["https://support.f5.com/csp/article/K6850",
            "https://devcentral.f5.com/s/articles/the-big-ip-application-security-manager-part-1-what-is-the-asm"
          ],
          :match_type => :content_cookies,
          :match_content => /TS[0-9a-f]{6}_[0-9a-f]=/,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Networking", "WAF"],
          :vendor => "F5",
          :product =>"BIG-IP Application Security Manager",
          :match_details =>"TS cookie",
          :version => "11.4.0 through 13.x",
          :references => ["https://support.f5.com/csp/article/K6850",
            "https://devcentral.f5.com/s/articles/the-big-ip-application-security-manager-part-1-what-is-the-asm"
          ],
          :match_type => :content_cookies,
          :match_content => /TS[0-9a-f]{7}_[0-9a-f]=/,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Networking", "WAF"],
          :vendor => "F5",
          :product =>"BIG-IP Application Security Manager",
          :match_details =>"TS cookie",
          :version => "14.0.0 and later",
          :references => ["https://support.f5.com/csp/article/K6850",
            "https://devcentral.f5.com/s/articles/the-big-ip-application-security-manager-part-1-what-is-the-asm"
          ],
          :match_type => :content_cookies,
          :match_content => /TS[0-9a-f]{7}[0-9a-f]=/,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "hardware",
          :tags => ["Networking", "Load Balancer"],
          :vendor => "F5",
          :product =>"BIG-IP Local Traffic Manager",
          :match_details =>"F5 BIG-IP Load balancer cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /BIGipServer/,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        }, 
        {
          :type => "fingerprint",
          :category => "hardware",
          :tags => ["Networking", "Load Balancer"],
          :vendor => "F5",
          :product =>"BIG-IP Local Traffic Manager",
          :match_details =>"F5 BIG-IP Load balancer header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^server: BigIP$/i,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end

  end
end
end
end
