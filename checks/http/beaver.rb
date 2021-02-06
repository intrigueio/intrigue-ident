module Intrigue
module Ident
module Check
module Private
class Beaver < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
        :type => "fingerprint",
        :category => "service",
        :tags => ["WebServer", "Hosting"],
        :vendor => "Beaver",
        :product => "Beaver",
        :references => ["https://beaver-web.com/"],
        :match_details =>"Beaver server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: Beaver$/i,
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