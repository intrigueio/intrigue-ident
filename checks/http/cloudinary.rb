module Intrigue
    module Ident
    module Check
    module Private
    class Cloudinary < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "CMS", "CDN"],
                :vendor => "Cloudinary",
                :product => "Cloudinary",
                :website => "https://cloudinary.com/",
                :match_details =>"Cloudinary - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server: Cloudinary$/i,
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