module Intrigue
module Ident
module Check
module Private
class Spidr < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Messaging"],
            :vendor => "SPIDR Tech",
            :product => "SPIDR",
            :website => "https://www.spidrtech.com/",
            :match_details =>"SPIDR platform session cookie.",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /spidr-platform-session/i,
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