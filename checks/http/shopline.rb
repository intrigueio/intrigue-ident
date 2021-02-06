module Intrigue
    module Ident
    module Check
    module Private
    class Shopline < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce", "PaaS"],
                :vendor => "Shopline",
                :product => "Shopline",
                :website => "http://www.shoplineapp.com/",
                :match_details => "Shopline - _prod_shopline_auth_session_id_v3 Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_prod_shopline_auth_session_id_v3=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce", "PaaS"],
                :vendor => "Shopline",
                :product => "Shopline",
                :website => "http://www.shoplineapp.com/",
                :match_details => "Shopline - _shop_shopline_session_id_v3 Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_shop_shopline_session_id_v3=/,
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