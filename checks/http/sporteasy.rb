module Intrigue
    module Ident
    module Check
    module Private
    class SportEasy < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "SportEasy",
                :product => "SportEasy",
                :website => "https://www.sporteasy.net/",
                :match_details => "SportEasy - se_csrftoken Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /se_csrftoken=/,
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