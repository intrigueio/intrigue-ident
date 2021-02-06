module Intrigue
    module Ident
    module Check
    module Private
    class DCWeb < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting"],
                :vendor => "DCWeb",
                :product => "DCWeb",
                :website => "https://www.dcweb.ph/",
                :match_details => "DCWeb - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ DCWeb\/(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ DCWeb\/(\d+(\.\d+)*)$/i)
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