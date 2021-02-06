module Intrigue
    module Ident
    module Check
    module Private
    class BlackBerry < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Security"],
                :vendor => "Certicom Corp",
                :product => "Managed PKI",
                :website => "https://www.certicom.com/content/certicom/en/products-and-services/managed-certificate-service.html",
                :match_details =>"Certicom Managed PKI - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Certicom ManagedPKI$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "BlackBerry",
                :product => "Web Server",
                :website => "https://www.blackberry.com/",
                :match_details =>"BlackBerry Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: BB$/i,
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