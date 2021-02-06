module Intrigue
module Ident
module Check
module Private
class Cocc < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting"],
            :vendor => "COCC",
            :product => "COCC",
            :website => "https://www.cocc.com/",
            :match_details =>"COCC Web Hosting",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ COCC\_WebHosting$/i,
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
