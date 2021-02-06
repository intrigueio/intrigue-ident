module Intrigue
module Ident
module Check
module Private
class TwistedMatrixLabs < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Twisted Matrix Labs",
            :product => "Twisted Web",
            :website => "https://twistedmatrix.com/",
            :match_details =>"Twisted server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /(Twisted\/(\d+(\.\d+)*) TwistedWeb\/(\d+(\.\d+)*)(\+[a-z0-9]+)?)$/i,
            :dynamic_version => lambda {|x| 
                version = _first_header_capture(x,/(Twisted\/(\d+(\.\d+)*) TwistedWeb\/(\d+(\.\d+)*)(\+[a-z0-9]+)?)$/i)
              },
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Twisted Matrix Labs",
            :product => "Twisted Web",
            :website => "https://twistedmatrix.com/",
            :references => ["https://www.cvedetails.com/cve/CVE-2019-12387/",
                            "https://www.cybersecurity-help.cz/vdb/SB2020031234"],
            :match_details =>"Twisted server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ TwistedWeb\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                version = _first_header_capture(x,/^server:\ TwistedWeb\/(\d+(\.\d+)*)$/i)
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