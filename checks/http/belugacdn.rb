module Intrigue
    module Ident
    module Check
    module Private
    class BelugaCDN < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CDN"],
                :vendor => "BelugaCDN",
                :product =>"NuCDN",
                :website => "https://www.belugacdn.com/",
                :references => ["https://www.peeringdb.com/net/311"],
                :match_details =>"BelugaCDN NuCDN - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: NuCDN\/v(\d+(\.\d+)*)$/i,
                :dynamic_version => lambda {|x|
                    _first_header_capture(x, /^server: NuCDN\/v(\d+(\.\d+)*)$/i)
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