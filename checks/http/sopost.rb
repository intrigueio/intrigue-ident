module Intrigue
    module Ident
    module Check
    module Private
    class SoPost < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Social", "E-Commerce", "Advertising"],
                :vendor => "SoPost",
                :product =>"SoPost",
                :website => "https://sopost.com/",
                :match_details =>"SoPost - _sopost_key Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_sopost_key=/,
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