module Intrigue
    module Ident
    module Check
    module Private
    class Tumbrl < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Tumblr",
                :product => "Tumblr",
                :website => "http://www.tumblr.com/",
                :match_details =>"Tumblr - X-Tumblr-User header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Tumblr-User:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Tumblr",
                :product => "Tumblr",
                :website => "http://www.tumblr.com/",
                :match_details =>"Tumblr - X-Tumblr-pixel header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Tumblr-pixel:/i,
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
    