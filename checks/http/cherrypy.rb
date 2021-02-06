module Intrigue
module Ident
module Check
module Private
class Cherrypy < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Web Framework"],
            :vendor => "CherryPy",
            :product => "CherryPy",
            :website => "https://cherrypy.org/",
            :match_details => "CherryPY web framework header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: CherryPy\/(\d+(\.\d+)*)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: CherryPy\/(\d+(\.\d+)*)$/i)
                    },
            :hide => false,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WSGI"],
            :vendor => "CherryPy",
            :product => "CherryPy WSGI",
            :website => "https://cherrypy.org/",
            :references => ["https://www.digitalocean.com/community/tutorials/how-to-deploy-python-wsgi-applications-using-a-cherrypy-web-server-behind-nginx"],
            :match_details => "CherryPY Web Server Gateway Interface.",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: CherryPy\/(\d+(\.\d+)*) WSGI Server$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: CherryPy\/(\d+(\.\d+)*) WSGI Server$/i)
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