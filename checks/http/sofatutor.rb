module Intrigue
    module Ident
    module Check
    module Private
    class Sofatutor < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS", "Education"],
                :vendor => "Sofatutor",
                :product => "Sofatutor",
                :website => "https://us.sofatutor.com/",
                :match_details => "Sofatutor - _sofatutor_session_start Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_sofatutor_session_start=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS", "Education"],
                :vendor => "Sofatutor",
                :product => "Sofatutor",
                :website => "https://us.sofatutor.com/",
                :match_details => "Sofatutor - _sofatutor_last_activity Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_sofatutor_last_activity=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["PaaS", "Education"],
                :vendor => "Sofatutor",
                :product => "Sofatutor",
                :website => "https://us.sofatutor.com/",
                :match_details => "Sofatutor - _sofatutor_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_sofatutor_session=/,
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