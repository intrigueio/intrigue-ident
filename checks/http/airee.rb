module Intrigue
    module Ident
    module Check
    module Private
    class Airee < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN", "Cloud"],
                :vendor => "Airee",
                :product => "Airee",
                :website => "https://айри.рф/",
                :match_details =>"Airee - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Airee\/Cloud$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN", "Cloud"],
                :vendor => "Airee",
                :product => "Airee",
                :website => "https://айри.рф/",
                :match_details =>"Airee - x-airee-node header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-airee-node:/i,
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
    