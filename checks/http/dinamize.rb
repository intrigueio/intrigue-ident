module Intrigue
module Ident
module Check
module Private
class Dinamize < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Wordpress Plugin"],
            :vendor => "Dinamize",
            :product => "Dinamize",
            :website => "https://www.dinamize.com.br/",
            :match_details =>"Dinamize Wordpress plugin",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Dinamize-Download$/,
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