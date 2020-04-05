module Intrigue
module Ident
module Check
class Wix < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["COTS","Development"],
            :vendor => "Wix.com Ltd.",
            :product => "Wix",
            :website => "https://dev.wix.com",
            :match_details => "x wix request id",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-wix-request-id:/i,
            :paths => ["#{url}"],
            :inference => false
        }
    ]
    end

end
end
end
end
