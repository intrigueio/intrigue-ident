module Intrigue
    module Ident
    module Check
    module Private
    class Altice < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Reverse Proxy"],
                :vendor => "Altice",
                :product => "SFR Reverse Proxy",
                :website => "http://sfr.com/",
                :match_details =>"SFR Reverse Proxy server header.",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ SFR\ Reverse\ Proxy$/i,
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