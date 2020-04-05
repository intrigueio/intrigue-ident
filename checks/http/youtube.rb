module Intrigue
module Ident
module Check
class Youtube < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting", "SaaS", "Cloud"],
            :vendor => "Google, Inc",
            :product => "Youtube",
            :website => "https://www.youtube.com/",
            :match_details => "Youtube frontend proxy header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: YouTube Frontend Proxy$/i,
            :paths => ["#{url}"],
            :inference => false
        }
    ]
    end

end
end
end
end