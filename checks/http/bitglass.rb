module Intrigue
module Ident
module Check
module Private
class Bitglass < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["CASB","Cloud"],
            :vendor => "Bitglass, Inc",
            :product => "Bitglass",
            :website => "https://www.bitglass.com/",
            :match_details =>"Bitglass server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Bitglass$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["CASB","Cloud"],
            :vendor => "Bitglass, Inc",
            :product => "Bitglass",
            :website => "https://www.bitglass.com/",
            :match_details =>"Bitglass header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x-bitglass: /i,
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