module Intrigue
    module Ident
    module Check
    module Private
    class SteelWoolEntertainment < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management", "Marketing"],
                :vendor => "Steel Wool Entertainment",
                :product => "Steel Wool Entertainment",
                :website => "http://www.steelwoolentertainment.com/",
                :match_details => "Steel Wool Entertainment - _steelwool_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_steelwool_session=/,
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