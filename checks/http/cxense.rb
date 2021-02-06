module Intrigue
module Ident
module Check
module Private
class Cxense < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Marketing", "Analytics", "SaaS"],
            :vendor => "Cxense",
            :product => "Cxense",
            :website => "https://www.cxense.com/",
            :match_details =>"Cxense server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Cxense\ Video$/,
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