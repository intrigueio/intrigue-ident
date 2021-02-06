module Intrigue
module Ident
module Check
module Private
class Serko < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "Serko Ldt",
            :product => "Serko",
            :website => "https://www.serko.com",
            :match_details =>"Serko shared app proxy",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^X-Serko-Proxy: sydsharedappproxy\d$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },        
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "Serko Ldt",
            :product => "Serko",
            :website => "https://www.serko.com",
            :match_details =>"Serko online auth cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /SERKOOnlineAUTH/i,
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