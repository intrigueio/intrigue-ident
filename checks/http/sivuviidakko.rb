module Intrigue
    module Ident
    module Check
    module Private
    class Sivuviidakko < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Sivuviidakko",
                :product => "Sivuviidakko",
                :website => "https://www.sivuviidakko.fi/",
                :match_details =>"Sivuviidakko - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<meta name="generator" content="Sivuviidakko/i,
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
    