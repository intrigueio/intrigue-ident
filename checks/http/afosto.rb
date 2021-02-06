module Intrigue
    module Ident
    module Check
    module Private
    class Afosto < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce","SaaS"],
                :vendor => "Afosto",
                :product => "Afosto",
                :website => "http://afosto.com/",
                :match_details =>"Afosto - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /X-Powered-By: Afosto SaaS BV/i,
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