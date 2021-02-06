module Intrigue
    module Ident
    module Check
    module Private
    class SpecialLearning < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Education"],
                :vendor => "Special-Learning",
                :product => "Special-Learning",
                :website => "https://www.special-learning.com/",
                :match_details => "Special-Learning - admin_sl_store_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /admin_sl_store_session=/,
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