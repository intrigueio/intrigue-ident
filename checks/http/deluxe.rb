module Intrigue
module Ident
module Check
module Private
class Deluxe < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Cloud", "Hosting", "CMS"],
            :vendor => "Deluxe Entertainment",
            :product => "Deluxe",
            :website => "https://www.bydeluxe.com/",
            :match_details =>"Deluxe server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Deluxe$/i,
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
        