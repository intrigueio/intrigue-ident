module Intrigue
    module Ident
    module Check
    module Private
    class Sailthru < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing", "Management"],
                :vendor => "Sailthru",
                :product => "Sailthru",
                :website => "https://www.sailthru.com/",
                :match_details =>"Sailthru - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Sailthru$/i,
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
                