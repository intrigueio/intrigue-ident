module Intrigue
module Ident
module Check
class Roundcube < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Email"],
            :vendor => "Roundcube",
            :product => "Roundcube",
            :website => "https://roundcube.net/",
            :match_details => "Roundcube title",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /:: Welcome to Roundcube/i,
            :paths => ["#{url}"],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Email"],
            :vendor => "Roundcube",
            :product => "Roundcube",
            :website => "https://roundcube.net/",
            :match_details => "Roundcube session cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content => /roundcube_sessid=/i,
            :paths => ["#{url}"], 
            :inference => false
        }
    ]
    end

end
end
end
end