module Intrigue
    module Ident
    module Check
    module Private
    class Crossbox < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "CrossBox",
                :product => "CrossBox",
                :website => "https://crossbox.io/",
                :match_details =>"CrossBox - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: CBX-WS$/i,
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
    