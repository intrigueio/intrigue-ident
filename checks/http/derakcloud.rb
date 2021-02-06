module Intrigue
    module Ident
    module Check
    module Private
    class Derakcloud < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: DERAK.CLOUD$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - derak-cache header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^derak-cache:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - derak-served header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^derak-served:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - derak-umbrage header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^derak-umbrage:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - __derak_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /__derak_session=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - __derak_auth cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /__derak_auth=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "DerakCloud",
                :product => "DerakCloud",
                :website => "https://derak.cloud/",
                :match_details =>"DerakCloud - __derak_user cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /__derak_user=/i,
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
    