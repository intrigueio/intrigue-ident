module Intrigue
    module Ident
    module Check
    module Private
    class Netlify < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Analytics"],
                :vendor => "Solovis",
                :product =>"Solovis",
                :website => "https://www.solovis.com/",
                :match_details =>"Solovis - _investment-chooser_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_investment-chooser_session=/,
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