module Intrigue
module Ident
module Check
class SalesForce < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CRM"],
            :vendor => "Salesforce",
            :product => "Salesforce ApexPages",
            :match_details => "x header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /x-powered-by: Salesforce.com ApexPages/i,
            :paths => ["#{url}"],
            :inference => false
        }
    ]
    end

end
end
end
end