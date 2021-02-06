module Intrigue
    module Ident
    module Check
    module Private
    class ChargeBee < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["WebServer"],
                :vendor => "ChargeBee",
                :product =>"ChargeBee Web Server",
                :website => "https://www.chargebee.com",
                :match_details =>"ChargeBee Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: ChargeBee$/i,
                :hide => false,
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
