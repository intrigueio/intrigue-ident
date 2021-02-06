module Intrigue
module Ident
module Check
module Private
class Securitykiss < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["VPN"],
            :vendor => "SecurityKISS Ltd",
            :product => "SecurityKISS Tunnel",
            :website => "https://www.securitykiss.com/",
            :match_details =>"SecurityKISS server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: securitykiss$/i,
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