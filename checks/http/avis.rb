module Intrigue
    module Ident
    module Check
    module Private
    class Avis < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Avis",
                :product => "WebServer",
                :website => "https://www.avis.com/en/home",
                :match_details => "Avis Web Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ avis\/(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ avis\/(\d+(\.\d+)*)$/i)
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