module Intrigue
    module Ident
    module Check
    module Private
    class Datadome < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Security"],
                :vendor => "Datadome",
                :product => "Datadome",
                :website => "https://datadome.co/",
                :match_details =>"Datadome - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Datadome$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Security"],
                :vendor => "Datadome",
                :product => "Datadome",
                :website => "https://datadome.co/",
                :match_details =>"Datadome - x-datadome header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-datadome:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Security"],
                :vendor => "Datadome",
                :product => "Datadome",
                :website => "https://datadome.co/",
                :match_details =>"Datadome - x-datadome-cid header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-datadome-cid:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Security"],
                :vendor => "Datadome",
                :product => "Datadome",
                :website => "https://datadome.co/",
                :match_details =>"Datadome - datadome cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /datadome=/i,
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
    