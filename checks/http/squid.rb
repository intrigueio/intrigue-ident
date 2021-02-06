module Intrigue
module Ident
module Check
module Private
class Squid < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "squid-cache",
            :product => "Squid",
            :website => "http://www.squid-cache.org",
            :match_details => "Squid proxy - server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server:\ squid\/?(\d+(\.(STABLE)?\d+)*)?$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server:\ squid\/?(\d+(\.(STABLE)?\d+)*)?$/i)
                },
            :hide => false,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "squid-cache",
            :product => "Squid",
            :website => "http://www.squid-cache.org",
            :match_details => "Squid error invalid url- server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^x-squid-error: ERR_INVALID_URL/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "squid-cache",
            :product => "Squid",
            :website => "http://www.squid-cache.org",
            :match_details => "Squid error cannot forward - server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^x-squid-error: ERR_CANNOT_FORWARD/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "squid-cache",
            :product => "Squid",
            :website => "http://www.squid-cache.org",
            :match_details => "Squid error access denied - server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^x-squid-error: ERR_ACCESS_DENIED/i,
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