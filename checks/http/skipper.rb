module Intrigue
    module Ident
    module Check
    module Private
    class Skipper < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Reverse Proxy", "HTTP Router"],
                :vendor => "Skipper",
                :product => "Skipper",
                :website => "https://opensource.zalando.com/skipper/",
                :match_details =>"Skipper",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ Skipper$/,
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