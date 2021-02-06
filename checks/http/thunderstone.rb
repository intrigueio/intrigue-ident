module Intrigue
module Ident
module Check
module Private
class Thunderstone < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development"],
            :vendor => "Thunderstone Software LLC",
            :product => "Texis",
            :website => "https://www.thunderstone.com/products-for-search/texis/",
            :match_details =>"Texis search engine header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Thunderstone\-Texis\/(\d+\.\d+\.\d+)$/i,
            :dynamic_version => lambda {|x| 
                version = _first_header_capture(x,/^server:\ Thunderstone\-Texis\/(\d+\.\d+\.\d+)$/i)
                },
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        }
    ]
    end
end
end
end
end
end