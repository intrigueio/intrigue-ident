module Intrigue
    module Ident
    module Check
    module Private
    class CineticInternetSystemhaus < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Cinetic Internet Systemhaus",
                :product => "Web Server",
                :website => "https://www.cinetic21.de/",
                :match_details =>"Cinetic Internet Systemhaus Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Cinetic\ Internet\ Systemhaus\ Webserver$/i,
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