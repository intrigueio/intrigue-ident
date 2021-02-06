module Intrigue
module Ident
module Check
module Private
class Boeing < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Reverse Proxy"],
            :vendor => "Boeing",
            :product => "Boeing Reverse Proxy",
            :website => "http://www.boeing.com/",
            :match_details => "Boeing Reverse Proxy server header.",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server:\ Boeing\/ReverseProxy\/V(\d\.\d\.\d)$/,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server:\ Boeing\/ReverseProxy\/V(\d\.\d\.\d)$/i)
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