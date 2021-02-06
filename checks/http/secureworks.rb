module Intrigue
module Ident
module Check
module Private
class Secureworks < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Security", "Cloud"],
            :vendor => "SecureWorks, Inc",
            :product => "SecureWorks Vunerability Scanning",
            :website => "https://www.secureworks.com/resources/ds-managed-vulnerability-scanning",
            :match_details =>"SecureWorks Vunerability Scanning login title",
            :version => nil,
            :match_type => :content_title,
            :match_content =>  /^SecureWorks\ Vunerability\ Scanning \- Login/,
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