module Intrigue
    module Ident
    module Check
    module Private
    class Bitrix < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Ecommerce"],
                :vendor => "Bitrix",
                :product => "Bitrix",
                :website => "http://www.1c-bitrix.ru/",
                :match_details =>"Bitrix - x-powered-cms header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Powered-CMS: Bitrix Site Manager$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Ecommerce"],
                :vendor => "Bitrix",
                :product => "Bitrix",
                :website => "http://www.1c-bitrix.ru/",
                :match_details =>"Bitrix - BITRIX_SM_GUEST_ID cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /BITRIX_SM_GUEST_ID=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Ecommerce"],
                :vendor => "Bitrix",
                :product => "Bitrix",
                :website => "http://www.1c-bitrix.ru/",
                :match_details =>"Bitrix - BITRIX_SM_LAST_VISIT cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /BITRIX_SM_LAST_VISIT=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Ecommerce"],
                :vendor => "Bitrix",
                :product => "Bitrix",
                :website => "http://www.1c-bitrix.ru/",
                :match_details =>"Bitrix - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<script type=.text\/javascript. src=.\/bitrix\/js\/main\/core\/core.min.js/i,
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