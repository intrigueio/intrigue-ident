module Intrigue
    module Ident
    module Check
    module Private
    class Akaunting < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management" "Accounting"],
                :vendor => "Akaunting",
                :product => "Akaunting",
                :website => "https://akaunting.com/",
                :match_details =>"Akaunting - X-Akaunting header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Akaunting:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management" "Accounting"],
                :vendor => "Akaunting",
                :product => "Akaunting",
                :website => "https://akaunting.com/",
                :match_details =>"Akaunting - akaunting_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /akaunting_session/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management" "Accounting"],
                :vendor => "Akaunting",
                :product => "Akaunting",
                :website => "https://akaunting.com/",
                :match_details =>"Akaunting - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /Powered by Akaunting/i,
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