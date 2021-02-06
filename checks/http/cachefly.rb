module Intrigue
    module Ident
    module Check
    module Private
    class Cachefly < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: CFS$/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - x-cf-rand header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-cf-rand:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - x-cf-tsc header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-cf-tsc:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - x-cf1 header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-cf1:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - x-cf2 header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-cf2:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - x-cf3 header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-cf3:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Cache"],
                :vendor => "CacheFly",
                :product => "CacheFly",
                :website => "http://www.cachefly.com/",
                :match_details =>"CacheFly - x-cff header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-cff:/i,
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
    
