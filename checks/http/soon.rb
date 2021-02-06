module Intrigue
module Ident
module Check
module Private
class Soon < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Index Server"],
            :vendor => "Soon London LTD",
            :product => "Pravis",
            :website => "https://github.com/thisissoon/pravis",
            :match_details => "Soon Index server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: PRAVIS\/(\d+\.\d+)$/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server: PRAVIS\/(\d+\.\d+)$/i)
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