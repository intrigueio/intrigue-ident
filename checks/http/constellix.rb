module Intrigue
module Ident
module Check
module Private
class Constellix < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Load Balancer"],
            :vendor => "Constellix",
            :product => "Constellix DNS Load Balancing",
            :website => "https://constellix.com/dns/load-balancing/",
            :match_details =>"Constellix Load Balancer header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Constellix\ HTTP\ Redirection$/i,
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