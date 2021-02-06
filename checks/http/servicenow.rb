module Intrigue
module Ident
module Check
module Private
class Servicenow < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Cloud", "PaaS", "SaaS"],
            :vendor => "ServiceNow, Inc",
            :product => "ServiceNow",
            :website => "https://www.servicenow.com/",
            :match_details => "ServiceNow server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: ServiceNow$/i,
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
    