module Intrigue
module Ident
module Check
module Private
class SouthRiverTechonologies < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["FTPServer"],
            :vendor => "South River Technologies",
            :product => "Titan FTP Server",
            :website => "https://titanftp.com/",
            :match_details => "Titan FTP Server",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server:\ Titan\ FTP\ Server\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server:\ Titan\ FTP\ Server\/(\d+(\.\d+)*)$/i)
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