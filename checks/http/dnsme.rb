module Intrigue
module Ident
module Check
class DNSME < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["CDN","WAF","SaaS"],
            :vendor => "DNS Made Easy",
            :product => "DNS Made Easy",
            :website => "https://dnsmadeeasy.com/",
            :match_details => "Server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: DNSME HTTP Redirection/i,
            :paths => ["#{url}"],
            :inference => false
        }
    ]
    end

end
end
end
end
    