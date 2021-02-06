module Intrigue
    module Ident
    module Check
    module Private
    class Darwin < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Operating System"],
                :vendor => "Darwin",
                :product => "Darwin",
                :website => "https://darwinsoftware.io/",
                :referneces => ["https://opensource.apple.com/"],
                :match_details =>"Darwin - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: Darwin$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Operating System"],
                :vendor => "Darwin",
                :product => "Darwin",
                :website => "https://darwinsoftware.io/",
                :referneces => ["https://opensource.apple.com/"],
                :match_details =>"Darwin - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Darwin$/i,
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
    