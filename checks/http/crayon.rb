module Intrigue
    module Ident
    module Check
    module Private
    class Crayon < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics", "Marketing"],
                :vendor => "Crayon",
                :product => "Crayon",
                :website => "https://www.crayon.co/",
                :match_details => "Crayon - crayon_distinct_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /crayon_distinct_id=/,
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