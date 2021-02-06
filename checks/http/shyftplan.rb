module Intrigue
    module Ident
    module Check
    module Private
    class Shyftplan < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "HR"],
                :vendor => "Shyftplan",
                :product => "Shyftplan",
                :website => "https://shyftplan.com/",
                :match_details => "Shyftplan - _shyftplan_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_shyftplan_session_\d*=/,
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