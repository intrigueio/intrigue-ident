module Intrigue
module Ident
module Check
module Private
class Cgarchitect < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Social","Commerce"],
            :vendor => "CGarchitect Shoppe",
            :product => "CGarchitect",
            :website => "https://www.cgarchitect.com/",
            :match_details =>"CGarchitect session cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /_cgarchitect_platform_session/,
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