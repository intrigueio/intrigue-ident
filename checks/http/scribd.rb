module Intrigue
    module Ident
    module Check
    module Private
    class Scribd < Intrigue::Ident::Check::Base
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ebook Server", "SaaS"],
                :vendor => "Scribd",
                :product => "Scribd",
                :website => "https://www.scribd.com/",
                :match_details => "Scribd - scribd_ubtc Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /scribd_ubtc=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ebook Server", "SaaS"],
                :vendor => "Scribd",
                :product => "Scribd",
                :website => "https://www.scribd.com/",
                :match_details => "Scribd - _scribd_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_scribd_session=/,
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