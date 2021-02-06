module Intrigue
    module Ident
    module Check
    module Private
    class Cougar < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Cougar",
                :product =>"Cougar",
                :website => "http://betfair.github.io/cougar/",
                :match_details =>"Cougar - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Cougar\/(\d+(.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: Cougar\/(\d+(.\d+)*)$/i)
                },
                :hide => false,
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