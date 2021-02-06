module Intrigue
    module Ident
    module Check
    module Private
    class Dotclear < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dotclear",
                :product => "Dotclear",
                :website => "http://dotclear.org/",
                :match_details =>"Dotclear - X-Dotclear-Static-Cache header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^X-Dotclear-Static-Cache:/i,
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
    