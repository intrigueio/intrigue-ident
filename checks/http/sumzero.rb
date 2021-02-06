module Intrigue
    module Ident
    module Check
    module Private
    class SumZero < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Marketing", "Finance"],
                :vendor => "SumZero",
                :product => "SumZero",
                :website => "https://www.sumzero.com/",
                :match_details => "SumZero - _sumzero_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_sumzero_session=/,
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