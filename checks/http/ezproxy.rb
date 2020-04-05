module Intrigue
module Ident
module Check
class EZproxy < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy Server"],
            :vendor => "OCLC",
            :product => "EZproxy",
            :website => "https://www.oclc.org/en/ezproxy.html",
            :match_details => "EZproxy server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: EZproxy$/i,
            :paths => ["#{url}"],
            :inference => false
        }
    ]
    end

end
end
end
end