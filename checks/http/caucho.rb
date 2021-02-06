module Intrigue
module Ident
module Check
module Private
class Caucho < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Caucho",
            :product => "Resin",
            :website => "https://caucho.com",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: resin\/(\d+(\.\d+)*)$/i,
            :match_details => "Resin server header",
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: resin\/(\d+(\.\d+)*)$/i)
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
        
        