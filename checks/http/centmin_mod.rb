module Intrigue
    module Ident
    module Check
    module Private
    class CentminMod < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Centmin Mod",
                :product => "Centmin Mod",
                :website => "https://centminmod.com/",
                :match_details =>"Centin Mod - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: nginx centminmod$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Centmin Mod",
                :product => "Centmin Mod",
                :website => "https://centminmod.com/",
                :match_details =>"Centin Mod - X-Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: centminmod$/i,
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