module Intrigue
module Ident
module Check
module Private
class SunMicrosystems < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Mail Server"],
        :vendor => "Sun Microsystems, Inc",
        :product =>"Solstice Internet Mail Server",
        :website => "http://web.mit.edu/solarisdev/www/solaris2.6/html/sims.html",
        :match_details =>"Solstice Internet Mail Server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server:\ Solstice\ (\d+\.\d+)$/i,
        :dynamic_version => lambda {|x| 
                version = _first_header_capture(x,/^server:\ Solstice\ (\d+\.\d+)$/i)
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