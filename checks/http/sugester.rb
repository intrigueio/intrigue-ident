module Intrigue
    module Ident
    module Check
    module Private
    class Sugester < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "CRM"],
                :vendor => "Sugester",
                :product => "Sugester",
                :website => "https://sugester.com/",
                :match_details => "Sugester - _sugester_session_v3 Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_sugester_session_v3=/,
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