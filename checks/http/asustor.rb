module Intrigue
    module Ident
    module Check
    module Private
    class Asustor < Intrigue::Ident::Check::Base
    
    def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management", "Storage"],
                :vendor => "ASUSTOR Inc",
                :product => "Data Master",
                :website => "https://www.asustor.com/admv2?type=1&subject=1&sub=101",
                :match_details => "ASUSTOR Data Master",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ ADM\/(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/^server:\ ADM\/(\d+(\.\d+)*)$/i)
                    },
                :hide => false,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => true
            },
            {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management", "Storage"],
                :vendor => "ASUSTOR Inc",
                :product => "Data Master",
                :website => "https://www.asustor.com/admv2?type=1&subject=1&sub=101",
                :match_details => "ASUSTOR Data Master - Page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /ADM\/(\d+(\.\d+)*)/i,
                :dynamic_version => lambda {|x| 
                        version = _first_header_capture(x,/ADM\/(\d+(\.\d+)*)/i)
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