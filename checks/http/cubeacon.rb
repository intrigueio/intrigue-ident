module Intrigue
    module Ident
    module Check
    module Private
    class Cubeacon < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "IoT"],
                :vendor => "Cubeacon",
                :product => "Cubeacon",
                :website => "https://cubeacon.com/",
                :match_details =>"Cubeacon - cubeacon_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /cubeacon_session=/,
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