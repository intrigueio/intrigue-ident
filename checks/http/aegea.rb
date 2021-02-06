module Intrigue
    module Ident
    module Check
    module Private
    class Aegea < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Aegea",
                :product => "Aegea",
                :website => "http://blogengine.ru/",
                :match_details =>"Aegea - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: E2 Aegea/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^x-powered-by: E2 Aegea v(\d+(\.\d+)*)/i)
                },
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
    