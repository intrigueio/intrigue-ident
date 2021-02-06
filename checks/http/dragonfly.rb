module Intrigue
    module Ident
    module Check
    module Private
    class Dragonfly < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dragonfly",
                :product => "Dragonfly",
                :website => "https://dragonflycms.org/",
                :match_details =>"Dragonfly CMS - powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Powered-By: Dragonfly CMS/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dragonfly",
                :product => "Dragonfly",
                :website => "https://dragonflycms.org/",
                :match_details =>"Dragonfly CMS - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<meta name=.generator. content=.CPG Dragonfly CMS/i,
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
    