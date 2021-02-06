module Intrigue
    module Ident
    module Check
    module Private
    class TrunKey < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Support", "SaaS", "Security"],
                :vendor => "Trunkey",
                :product => "Trunkey",
                :website => "http://trunkey.com/",
                :references => ["https://icp.qingcloud.com/"],
                :match_details =>"Trunkey - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Trunkey$/i,
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