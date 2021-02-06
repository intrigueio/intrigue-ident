module Intrigue
    module Ident
    module Check
    module Private
    class Totaljs < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Totaljs",
                :product => "Total\.js",
                :website => "https://totaljs.com/",
                :match_details =>"Total.js - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-powered-by: total\.js/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^x-powered-by: total\.js v(\d+(\.\d+)*)$/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            }
        ]
        end
    end
    end
    end
    end
    end
    