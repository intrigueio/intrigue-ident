module Intrigue
    module Ident
    module Check
    module Private
    class Boost < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Boost",
                :product =>"Beast",
                :website => "https://www.boost.org/",
                :reference => ["https://www.boost.org/doc/libs/1_73_0/libs/beast/doc/html/index.html"],
                :match_details =>"Boost.Beast - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Boost.Beast\/(\d+)*$/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: Boost.Beast\/(\d+)*$/i)
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