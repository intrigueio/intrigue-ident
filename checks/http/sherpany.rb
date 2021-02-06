module Intrigue
    module Ident
    module Check
    module Private
    class Sherpany < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Sherpany",
                :product => "Sherpany Web Server",
                :website => "https://www.sherpany.com/",
                :match_details => "Sherpany Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Sherpany$/i,
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