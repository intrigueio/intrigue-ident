module Intrigue
    module Ident
    module Check
    module Private
    class SundaySky < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Marketing", "Cloud", "SaaS"],
                :vendor => "SundaySky",
                :product => "SmartVideo",
                :website => "https://sundaysky.com/",
                :match_details => "SundaySky SmartVideo - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: SmartVideo$/i,
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