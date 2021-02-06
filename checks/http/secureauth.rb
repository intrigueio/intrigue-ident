module Intrigue
module Ident
module Check
module Private
class Secureauth < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Security", "IAM"],
            :vendor => "SecureAuth",
            :product => "SecureAuth",
            :website => "https://www.secureauth.com/",
            :match_details =>"SecureAuth page inject",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /\"no-js\" lang=\"\w{2}\" ng-app=\"secureauth\">/,
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