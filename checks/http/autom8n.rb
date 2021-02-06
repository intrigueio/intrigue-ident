module Intrigue
    module Ident
    module Check
    module Private
    class Autom8n < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["IaaS", "Cloud", "Hosting", "Load Balancer"],
                :vendor => "Autom8n",
                :product => "Autom8n",
                :website => "https://autom8n.com/",
                :match_details =>"Autom8n Nginx - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: AUTOM8N-nginx$/i,
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