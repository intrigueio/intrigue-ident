module Intrigue
    module Ident
    module Check
    module Private
    class Scholastica < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting"],
                :vendor => "Scholastica",
                :product => "Scholastica",
                :website => "https://scholasticahq.com/",
                :match_details => "Scholastica - _scholastica_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_scholastica_session=/,
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