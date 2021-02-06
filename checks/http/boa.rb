module Intrigue
module Ident
module Check
module Private
class Boa < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Boa",
            :product =>"Boa",
            :website => "http://www.boa.org/",
            :references => ["https://en.wikipedia.org/wiki/Boa_(web_server)"],
            :match_details =>"Boa - server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: Boa/i,
            :dynamic_version => lambda {|x| 
                version = _first_header_capture(x, /^server: Boa\/(\d+(\.\d+)*)/i)
            },
            :dynamic_update => lambda {|x|
                update = _first_header_capture(x, /^server: Boa\/(?:\d+(?:\.\d+)*(rc\d*|\w)?)$/i)
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