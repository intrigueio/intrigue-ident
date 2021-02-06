module Intrigue
module Ident
module Check
module Private
class BlueIrisSoftware < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Video Security"],
            :vendor => "Blue Iris",
            :product =>"Blue Iris Video Management Software",
            :website => "https://blueirissoftware.com/",
            :match_details =>"Blue Iris Video Management Software header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: BlueIris-HTTP\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: BlueIris-HTTP\/(\d+(\.\d+)*)$/i)
                },
            :hide => false,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Video Security"],
            :vendor => "Blue Iris",
            :product =>"Blue Iris Video Management Software",
            :website => "https://blueirissoftware.com/",
            :match_details =>"Blue Iris Video Management Software login title",
            :version => nil,
            :match_type => :content_title,
            :match_content =>  /^Blue Iris Login$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Blue Iris",
            :product =>"Blue Server",
            :website => "https://blueirissoftware.com/",
            :match_details =>"Blue Iris Server",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: BlueServer\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: BlueServer\/(\d+(\.\d+)*)$/i)
                },
            :hide => false,
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