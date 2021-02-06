module Intrigue
module Ident
module Check
module Private
class Aloaha < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor => "Aloaha",
        :product =>"Aloaha MailAndArchive",
        :website => "https://www.aloaha.com/server-solutions/",
        :match_details =>"Aloaha MailAndArchive Web Server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server: Aloaha Web Server \/(\d+(\.\d+)*)$/i,
        :dynamic_version => lambda {|x| 
                version = _first_header_capture(x,/^server: Aloaha Web Server \/(\d+(\.\d+)*)$/i)
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