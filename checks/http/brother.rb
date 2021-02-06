module Intrigue
module Ident
module Check
module Private
class Brother < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer", "Embedded"],
            :vendor => "Brother UK Ltd",
            :product => "Debut Embedded Httpd Server",
            :website => "https://www.brother.co.uk/printers",
            :references => ["https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/denial-of-service-vulnerability-in-brother-printers/", 
                "https://www.trustwave.com/en-us/resources/security-resources/security-advisories/?fid=18730",
                "https://www.exploit-db.com/exploits/43119",
                "https://packetstormsecurity.com/files/144908/Debut-Embedded-httpd-1.20-Denial-Of-Service.html"],
            :match_details =>"Debut Embedded Httpd - server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: debut\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                version = _first_header_capture(x,/^server: debut\/(\d+(\.\d+)*)$/i)
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