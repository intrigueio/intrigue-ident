module Intrigue
    module Ident
    module Check
    module Private
    class Sigopt < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Sigopt",
                :product => "Sigopt",
                :website => "https://sigopt.com/",
                :match_details => "Sigopt - sigoptsession Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /sigoptsession=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "Sigopt",
                :product => "Sigopt",
                :website => "https://sigopt.com/",
                :match_details => "Sigopt - sigoptstagingsession Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /sigoptstagingsession=/,
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