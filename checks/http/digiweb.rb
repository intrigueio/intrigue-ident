module Intrigue
    module Ident
    module Check
    module Private
    class Digiweb < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting"],
                :vendor => "Digiweb Ltd",
                :product => "Digiweb hosting",
                :website => "https://digiweb.ie/",
                :references => ["https://digiweb.ie/digiweb-no-1-irish-hosting-company/"],
                :match_details =>"Digiweb hosting",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Digiweb$/i,
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