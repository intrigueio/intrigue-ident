module Intrigue
    module Ident
    module Check
    module Private
    class Bunnycdn < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CDN"],
                :vendor => "BunnyCDN",
                :product => "BunnyCDN",
                :website => "https://bunnycdn.com/",
                :match_details =>"BunnyCDN - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: BunnyCDN-[\w\d]+-\d+$/i,
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