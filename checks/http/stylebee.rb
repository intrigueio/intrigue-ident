module Intrigue
    module Ident
    module Check
    module Private
    class StyleBee < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "StyleBee",
                :product => "StyleBee",
                :website => "https://www.stylebee.com/",
                :match_details => "StyleBee - _wasp_v1_production_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_wasp_v1_production_session=/,
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