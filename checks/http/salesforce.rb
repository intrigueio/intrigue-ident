module Intrigue
module Ident
module Check
class SalesForce < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Cloud", "CRM", "SaaS", "PaaS"],
            :vendor => "Salesforce",
            :product => "Salesforce ApexPages",
            :website => "https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_apexpages.htm",
            :match_details => "Salesforce Apex Pages header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^X-Powered-By: Salesforce\.com ApexPages$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        }
    ]
    end

end
end
end
end