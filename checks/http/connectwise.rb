module Intrigue
module Ident
module Check
module Private
class Connectwise < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Support", "Administrative"],
            :vendor => "ConnectWise, LLC",
            :product => "ConnectWise Control",
            :website => "https://www.connectwise.com/software/control",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: screenconnect\/(\d+(\.\d+)*) Microsoft-HTTPAPI\/\d+\.\d+$/i,
            :match_details => "ConnectWise Control server header",
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: screenconnect\/(\d+(\.\d+)*) Microsoft-HTTPAPI\/\d+\.\d+$/i)
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
    
    