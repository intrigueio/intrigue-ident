module Intrigue
module Ident
module Check
class DnsMadeEasy < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            type: "fingerprint",
            category: "service",
            tags: ["CDN","SaaS"],
            vendor: "DNS Made Easy",
            product: "DNS Made Easy",
            website: "https://dnsmadeeasy.com/",
            description: "DNS Made Easy redirection header",
            version: nil,
            match_logic: :all,
            matches: [
                {
                    match_type: :content_headers,
                    match_content:  /^server: DNSME HTTP Redirection$/i,
                }
            ],
            paths: [ { path: "#{url}", follow_redirects: true } ],
            inference: false
        }
    ]
    end

end
end
end
end
    