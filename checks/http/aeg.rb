module Intrigue
    module Ident
    module Check
    module Private
    class AEG < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Entertainment"],
                :vendor => "AEG",
                :product =>"AEG",
                :website => "https://www.aegworldwide.com/",
                :match_details =>"AEG - accord_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /accord_session=/,
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