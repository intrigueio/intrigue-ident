module Intrigue
    module Ident
    module Check
    module Private
    class Souche < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Souche",
                :product =>"Souche",
                :website => "http://www.souche.com/",
                :match_details =>"Souche - qiwahost___parentShopCode Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /qiwahost___parentShopCode=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Souche",
                :product =>"Souche",
                :website => "http://www.souche.com/",
                :match_details =>"Souche - qiwahost_siteId Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /qiwahost_siteId=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Souche",
                :product =>"Souche",
                :website => "http://www.souche.com/",
                :match_details =>"Souche - qiwahost_showAllShop Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /qiwahost_showAllShop=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Souche",
                :product =>"Souche",
                :website => "http://www.souche.com/",
                :match_details =>"Souche - qiwahost_usertag Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /qiwahost_usertag=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Souche",
                :product =>"Souche",
                :website => "http://www.souche.com/",
                :match_details =>"Souche - qiwahost_username Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /qiwahost_username=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Souche",
                :product =>"Souche",
                :website => "http://www.souche.com/",
                :match_details =>"Souche - qiwahost_crmUserId Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /qiwahost_crmUserId=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            }
        ]
        end
    end
    end
    end
    end
    end