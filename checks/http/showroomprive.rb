module Intrigue
    module Ident
    module Check
    module Private
    class Showroomprive < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Showroomprive",
                :product => "Showroomprive Web Server",
                :website => "https://www.showroomprive.com/",
                :match_details => "Showroomprive Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: SRP$/i,
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