module Intrigue
    module Ident
    module Check
    module Private
    class Arastta < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Arastta",
                :product => "Ecommerce",
                :website => "http://arastta.org",
                :match_details =>"Arastta Ecommerce - x-arastta header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-arastta/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Arastta",
                :product => "Ecommerce",
                :website => "http://arastta.org",
                :match_details =>"Arastta Ecommerce - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^arastta:.+(\d+(\.\d+)*)/i,
                :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^arastta:.+(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Arastta",
                :product => "Ecommerce",
                :website => "http://arastta.org",
                :match_details =>"Arastta Ecommerce - javascript file",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /<script src\=\".+arastta\.js\".+><\/script>/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Ecommerce"],
                :vendor => "Arastta",
                :product => "Ecommerce",
                :website => "http://arastta.org",
                :match_details =>"Arastta Ecommerce - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /Powered by.+(www\\.)?arastta\.org.+Arastta/i,
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