module Intrigue
module Ident
module Check
module Private
class DdosGuard < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WAF"],
            :vendor => "DDoS-GUARD",
            :product => "DDoS-GUARD",
            :website => "https://ddos-guard.net",
            :match_details =>"DDoS-GUARD header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ ddos\-guard$/i,
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