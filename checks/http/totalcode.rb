module Intrigue
    module Ident
    module Check
    module Private
    class Totalcode < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Ecommerce"],
                :vendor => "TotalCode",
                :product => "TotalCode",
                :website => "http://www.totalcode.com/",
                :match_details =>"TotalCode - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: TotalCode$/i,
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
    