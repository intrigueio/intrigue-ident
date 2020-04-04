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
            :match_details => "Server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: EZproxy/i,
            :paths => ["#{url}"],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy Server"],
            :vendor => "OCLC",
            :product => "EZproxy",
            :match_details => "Url reference",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /http[s]?:\/\/ezproxy\./i,
            :paths => ["#{url}"],
            :inference => false
        },
    ]
    end

end
end
end
end