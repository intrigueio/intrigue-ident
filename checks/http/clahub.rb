module Intrigue
    module Ident
    module Check
    module Private
    class Clahub < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["COTS"],
                :vendor => "Clahub",
                :product => "Clahub",
                :website => "https://github.com/clahub/clahub",
                :match_details => "Clahub - _clahub_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /_clahub_session=/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["COTS"],
                :vendor => "Clahub",
                :product => "Clahub",
                :website => "https://github.com/clahub/clahub",
                :match_details => "Clahub - Powered By Body Match",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /.*, powered by <a :?.*>CLAHub<\/a>/,
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