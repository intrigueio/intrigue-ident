module Intrigue
    module Ident
    module Check
    module Private
    class StoreVantage < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "CRM", "Marketing", "Security", "Development", "COTS"],
                :vendor => "Store Vantage",
                :product => "Store Vantage",
                :website => "https://www.storevantage.com/",
                :match_details => "Store Vantage - storevantage Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /storevantage=/,
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