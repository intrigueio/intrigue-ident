module Intrigue
    module Ident
    module Check
    module Private
    class Bigware < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Bigware",
                :product => "Bigware Shop",
                :website => "http://bigware.de/",
                :match_details =>"Bigware Shop - bigWAdminID cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /bigWAdminID=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Bigware",
                :product => "Bigware Shop",
                :website => "http://bigware.de/",
                :match_details =>"Bigware Shop - bigwarecsid cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content =>  /bigwarecsid=/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Bigware",
                :product => "Bigware Shop",
                :website => "http://bigware.de/",
                :match_details =>"Bigware Shop - Bigware page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<a href=.https.+bigware\.de.\starget=._blank.>\s*Diese Online Shopsoftware wurde entwickelt von Bigware\s*<\/a>/i,
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
    