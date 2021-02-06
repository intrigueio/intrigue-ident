module Intrigue
module Ident
module Check
module Private
class Bitninja < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Security", "WAF"],
            :vendor => "BitNinja",
            :product => "BitNinja",
            :website => "https://bitninja.io/",
            :match_details =>"BitNinja server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: BitNinja Captcha Server$/i,
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