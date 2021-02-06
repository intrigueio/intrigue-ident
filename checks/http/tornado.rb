module Intrigue
module Ident
module Check
module Private
class Tornado < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Tornado",
            :product => "Tornado",
            :website => "https://www.tornadoweb.org/en/stable/#",
            :match_details =>"Tornado web server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: TornadoServer\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: TornadoServer\/(\d+(\.\d+)*)$/i)
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