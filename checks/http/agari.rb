module Intrigue
    module Ident
    module Check
    module Private
    class Agari < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Security", "Networking"],
                :vendor => "Agari",
                :product =>"Agari",
                :website => "https://www.agari.com/",
                :match_details =>"Agari - _air_session_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_air_session_id=/,
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Security", "Networking"],
                :vendor => "Agari",
                :product =>"Agari",
                :website => "https://www.agari.com/",
                :match_details =>"Agari - _ep_session_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_ep_session_id=/,
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