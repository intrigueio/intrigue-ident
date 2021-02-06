module Intrigue
    module Ident
    module Check
    module Private
    class TradeGecko < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Tradeshift",
                :product =>"Tradeshift",
                :website => "https://tradeshift.com/",
                :match_details =>"Tradeshift - TS_UAA_SESSION Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /TS_UAA_SESSION=/,
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Tradeshift",
                :product =>"Tradeshift",
                :website => "https://tradeshift.com/",
                :match_details =>"Tradeshift - ts_prod_support_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /ts_prod_support_session=/,
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Tradeshift",
                :product =>"Tradeshift",
                :website => "https://tradeshift.com/",
                :match_details =>"Tradeshift - ts_sand_support_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /ts_sand_support_session=/,
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Tradeshift",
                :product =>"Tradeshift",
                :website => "https://tradeshift.com/",
                :match_details =>"Tradeshift - ts_cn_sand_support_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /ts_cn_sand_support_session=/,
                :hide => false,
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