module Intrigue
    module Ident
    module Check
    module Private
    class ServerTechnology < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["API"],
                :vendor => "Server Technology",
                :product => "JSON API Web Service",
                :website => "https://www.servertech.com/",
                :references => ["https://cdn10.servertech.com/assets/documents/documents/808/original/JSON_API_Web_Service_%28JAWS%29_V1.01.pdf?1562965069"],
                :match_details => "Server Technology JSON API Web Service - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ ServerTech-AWS\/(v\d+(\.\d+)*\w?)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ ServerTech-AWS\/(v\d+(\.\d+)*\w?)$/i)
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