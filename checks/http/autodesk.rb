module Intrigue
    module Ident
    module Check
    module Private
    class Autodesk < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Colaboration", "Development", "Cloud"],
                :vendor => "Autodesk, Inc",
                :product => "BIM 360 Glue",
                :website => "https://knowledge.autodesk.com/support/bim-360-glue",
                :match_details =>"BIM 360 Glue",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ GlueWeb$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Colaboration", "Development", "Cloud"],
                :vendor => "Autodesk, Inc",
                :product => "BIM 360 Glue",
                :website => "https://knowledge.autodesk.com/support/bim-360-glue",
                :match_details =>"BIM 360 Glue - Title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content =>  /^Autodesk\ BIM\ 360$/i,
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