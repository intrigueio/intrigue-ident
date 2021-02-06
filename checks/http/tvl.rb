module Intrigue
    module Ident
    module Check
    module Private
    class TVL < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "CMS"],
                :vendor => "TVL",
                :product => "TVL",
                :website => "https://tvl.com/",
                :match_details =>"TVL - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: TVL$/i,
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