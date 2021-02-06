module Intrigue
    module Ident
    module Check
    module Private
    class Ckan < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "CKAN",
                :product => "CKAN",
                :website => "http://ckan.org/",
                :match_details =>"CKAN - Access-Control-Allow-Headers header",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^Access-Control-Allow-Headers: X-CKAN-API-KEY/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "CKAN",
                :product => "CKAN",
                :website => "http://ckan.org/",
                :match_details =>"CKAN - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /\<meta name=.generator.\s*content=.ckan (\d+(\.\d+)*).\s*\/>/i,
                :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/\<meta name=.generator.\s*content=.ckan (\d+(\.\d+)*).\s*\/>/i)
                },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true  
            },
            
        ]
        end
    end
    end
    end
    end
    end
    