module Intrigue
    module Ident
    module Check
    module Private
    class Sushio < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Finance", "Management"],
                :vendor => "Sush.io",
                :product => "Sush.io",
                :website => "http://sush.io/",
                :match_details => "Sush.io - _sushio_apps_connector_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_sushio_apps_connector_session=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Finance", "Management"],
                :vendor => "Sush.io",
                :product => "Sush.io",
                :website => "http://sush.io/",
                :match_details => "Sush.io - _sushio_backoffice_v2_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_sushio_backoffice_v2_session=/,
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