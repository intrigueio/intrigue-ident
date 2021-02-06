module Intrigue
    module Ident
    module Check
    module Private
    class Trustwave < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WAF"],
                :vendor => "Trustwave",
                :product => "ModSecurity",
                :website => "https://www.modsecurity.org/",
                :match_details =>"ModSecurity - protected by reference",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /Protected by Mod Security/i,
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