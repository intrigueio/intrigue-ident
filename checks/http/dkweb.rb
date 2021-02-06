
module Intrigue
    module Ident
    module Check
    module Private
    class Dkweb < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting", "Cloud"],
                :vendor => "DK Web Solutions",
                :product => "DK Web Solutions",
                :website => "https://www.dk-websolutions.co.uk/",
                :match_details =>"DK Web Solutions - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: DKweb/i,
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