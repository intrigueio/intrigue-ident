module Intrigue
    module Ident
    module Check
    module Private
    class DenverPublicHealth < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Denver Public Health",
                :product => "Web Server",
                :website => "http://www.denverpublichealth.org/",
                :match_details =>"Denver Public Health Web Server",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ DenverHealth$/i,
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