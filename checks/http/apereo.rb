module Intrigue
    module Ident
    module Check
    module Private
    class Apereo < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CAS"],
                :vendor => "Apereo",
                :product => "CAS Server",
                :website => "https://www.apereo.org/projects/cas",
                :match_details =>"Apereo CAS Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Apereo\ CAS$/i,
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