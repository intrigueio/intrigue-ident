module Intrigue
module Ident
module Check
module Private
class Allstate < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Allstate Insurance Company",
            :product => "Allstate Web Server",
            :website => "https://www.allstate.com/",
            :match_details =>"Allstate server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Allstate( Insurance Co\.)?$/i,
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