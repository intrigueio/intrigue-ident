module Intrigue
    module Ident
    module Check
    module Private
    class Brayola < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce"],
                :vendor => "Brayola",
                :product => "Brayola",
                :website => "https://brayola.com/",
                :match_details =>"Brayola - brayolaSession Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /brayolaSession=/,
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