module Intrigue
    module Ident
    module Check
    module Private
    class SocialFlow < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS", "Marketing", "Social"],
                :vendor => "SocialFlow",
                :product => "SocialFlow",
                :website => "http://www.socialflow.com/",
                :match_details => "SocialFlow - sf_csrftoken Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /sf_csrftoken=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS", "Marketing", "Social"],
                :vendor => "SocialFlow",
                :product => "SocialFlow",
                :website => "http://www.socialflow.com/",
                :match_details => "SocialFlow - socialflow_web_session_v2 Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /socialflow_web_session_v2=/,
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