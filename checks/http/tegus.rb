module Intrigue
module Ident
module Check
module Private
class Tegus < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Analytics"],
            :vendor => "Tegus",
            :product => "Tegus",
            :website => "https://www.tegus.co/",
            :match_details =>"Tegus platform session cookie.",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /_tegus_session/,
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
        