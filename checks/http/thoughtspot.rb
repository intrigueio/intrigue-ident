module Intrigue
    module Ident
    module Check
    module Private
    class ThoughtSpot < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics"],
                :vendor => "ThoughtSpot",
                :product => "ThoughtSpot",
                :website => "https://www.thoughtspot.com",
                :match_details =>"ThoughtSpot - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ ThoughtSpot$/i,
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