module Intrigue
module Ident
module Check
module Private
class Secsign < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["2FA Server", "Security"],
            :vendor => "SecSign",
            :product => "ID Server",
            :website => "https://www.secsign.com/developers/on-premise-two-factor-authentication-server/",
            :match_details =>"SecSign ID Server",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ SecSignIDServer$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["2FA Server", "Security"],
            :vendor => "SecSign",
            :product => "ID Server",
            :website => "https://www.secsign.com/developers/on-premise-two-factor-authentication-server/",
            :match_details =>"SecSign ID Server - SecSign ID Serveraccount administration page title.",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /SecSign\ ID\ \-\ Account administration$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["2FA Server", "Security"],
            :vendor => "SecSign",
            :product => "ID Server",
            :website => "https://www.secsign.com/developers/on-premise-two-factor-authentication-server/",
            :match_details =>"SecSign ID Server - SecSign ID Server Dashboard page reference.",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<h1 class=\"secsign-blue\">SecSign ID Server Dashboard<\/h1>/i,
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