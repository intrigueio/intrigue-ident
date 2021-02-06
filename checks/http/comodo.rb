module Intrigue
module Ident
module Check
module Private
class Comodo < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WAF"],
            :vendor => "Comodo Group, Inc.",
            :product => "Comodo WAF",
            :website => "https://waf.comodo.com/",
            :match_details =>"Comodo WAF",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Protected\ by\ COMODO\ WAF$/,
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