module Intrigue
    module Ident
    module Check
    module Private
    class Avira < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Avira",
                :product => "Web Server",
                :website => "https://www.avira.com/",
                :match_details =>"Avira Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Avira\ OEGS$/i,
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