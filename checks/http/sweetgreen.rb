module Intrigue
    module Ident
    module Check
    module Private
    class Sweetgreen < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Sweetgreen",
                :product => "Sweetgreen",
                :website => "https://www.sweetgreen.com/",
                :match_details => "Sweetgreen - _sweetgreen_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_sweetgreen_session=/,
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