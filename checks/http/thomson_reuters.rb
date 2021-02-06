module Intrigue
    module Ident
    module Check
    module Private
    class ThomsonReuters < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Saas"],
                :vendor => "Thomson Reuters",
                :product => "Checkpoint",
                :website => "https://tax.thomsonreuters.com/en/checkpoint",
                :match_details =>"Thomson Reuters Checkpoint - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Thomson Reuters$/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ], 
                :inference => false
              },
        ]
        end
    end
    end
    end
    end
    end