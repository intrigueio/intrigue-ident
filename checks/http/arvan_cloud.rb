module Intrigue
    module Ident
    module Check
    module Private
    class ArvanCloud < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CDN", "Cloud"],
                :vendor => "ArvanCloud",
                :product => "ArvanCloud",
                :website => "https://www.saba.com/",
                :match_details =>"ArvanCloud - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ ArvanCloud$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CDN", "Cloud"],
                :vendor => "ArvanCloud",
                :product => "ArvanCloud",
                :website => "https://www.saba.com/",
                :match_details =>"ArvanCloud - powered by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^ar-poweredby:\ Arvan\ Cloud\ \(arvancloud\.com\)$/i,
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