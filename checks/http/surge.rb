module Intrigue
    module Ident
    module Check
    module Private
    class Surge < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CDN"],
                :vendor => "Surge",
                :product => "Surge CDN",
                :website => "https://surge.sh/help/about-the-surge-cdn",
                :match_details => "Surge CDN",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ SurgeCDN\/(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ SurgeCDN\/(\d+(\.\d+)*)$/i)
                    },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CDN"],
                :vendor => "Surge",
                :product => "Surge CDN",
                :website => "https://surge.sh/help/about-the-surge-cdn",
                :match_details => "Surge CDN - powered by reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /powered\ by\ <a\ href=\"https:\/\/surge\.sh\">surge\.sh/i,
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