module Intrigue
    module Ident
    module Check
    module Private
    class Basehttp < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "BaseHTTP",
                :product => "BaseHTTP",
                :website => "http://docs.python.org/2/library/basehttpserver.html",
                :match_details => "BaseHTTP - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: BaseHTTP\/(\d+(\.\d+)*) Python\/(\d+(\.\d+)*)/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server: BaseHTTP\/(\d+(\.\d+)*) Python\/(\d+(\.\d+)*)/i)
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