module Intrigue
module Ident
module Check
module Private
class Cbre < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "CBRE",
            :product => "CBRE BI Web server",
            :website => "https://www.cbre.com/",
            :match_details =>"CBRE BI Web server. Usually seen on CBRE domain pages.",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ CBRE\ BI\ Web\ server$/i,
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