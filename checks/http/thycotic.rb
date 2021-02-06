module Intrigue
module Ident
module Check
module Private
class Thycotic < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["SaaS", "PAM"],
            :vendor => "Thycotic",
            :product => "Secret Server",
            :website => "https://thycotic.com/products/secret-server/",
            :match_details =>"Secret Server server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: secretServer$/i,
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