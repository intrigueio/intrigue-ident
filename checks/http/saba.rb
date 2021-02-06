module Intrigue
module Ident
module Check
module Private
class Saba < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["SaaS", "Cloud"],
            :vendor => "Saba Software",
            :product => "Saba Cloud",
            :website => "https://www.saba.com/",
            :match_details =>"Saba Cloud header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Saba Cloud$/i,
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