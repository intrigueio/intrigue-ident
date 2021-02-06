module Intrigue
    module Ident
    module Check
    module Private
    class Seeburger < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Administrative"],
                :vendor => "SEEBURGER AG",
                :product => "Business Integration Suite",
                :website => "https://www.seeburger.com/platform/business-integration-suite/",
                :match_details =>"SEEBURGER Business Integration Suite",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^server:\ SEEBURGER\ BIS\ Link\ Manager$/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Administrative"],
                :vendor => "SEEBURGER AG",
                :product => "Business Integration Suite",
                :website => "https://www.seeburger.com/platform/business-integration-suite/",
                :match_details =>"SEEBURGER Business Integration Suite - page title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content =>  /^SEEBURGER\ BIS\ Link\ Manager$/,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Administrative"],
                :vendor => "SEEBURGER AG",
                :product => "Business Integration Suite",
                :website => "https://www.seeburger.com/platform/business-integration-suite/",
                :match_details =>"SEEBURGER Business Integration Suite - page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /SEEBURGER\ BIS\ Link\ Manager/,
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