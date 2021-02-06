module Intrigue
    module Ident
    module Check
    module Private
    class CorporationServiceCompany < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Security", "Domain Management"],
                :vendor => "Corporation Service Company",
                :product => "NetNames",
                :website => "https://www.cscdbs.com/?utm_source=registration%20holding%20page&utm_medium=registration%20holding%20page%20link&utm_content=homepage&utm_campaign=NetNames%20registration%20holding%20page",
                :match_details => "NetNames",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ NetNames$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Security", "Domain Management"],
                :vendor => "Corporation Service Company",
                :product => "NetNames",
                :website => "https://www.cscdbs.com/?utm_source=registration%20holding%20page&utm_medium=registration%20holding%20page%20link&utm_content=homepage&utm_campaign=NetNames%20registration%20holding%20page",
                :match_details => "NetNames - has been registered by NetNames page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /The\ domain\ name.+has\ been\ registered\ by\ NetNames\./i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Security", "Domain Management"],
                :vendor => "Corporation Service Company",
                :product => "NetNames",
                :website => "https://www.cscdbs.com/?utm_source=registration%20holding%20page&utm_medium=registration%20holding%20page%20link&utm_content=homepage&utm_campaign=NetNames%20registration%20holding%20page",
                :match_details => "NetNames - has been registered by NetNames title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content => /^The\ domain.+is\ registered\ by\ NetNames$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Security", "Domain Management"],
                :vendor => "Corporation Service Company",
                :product => "NetNames",
                :website => "https://www.cscdbs.com/?utm_source=registration%20holding%20page&utm_medium=registration%20holding%20page%20link&utm_content=homepage&utm_campaign=NetNames%20registration%20holding%20page",
                :match_details => "NetNames - copyright reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Copyright\ NetNames\ Limited/i,
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