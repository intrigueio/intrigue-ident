module Intrigue
module Ident
module Check
module Private
class Calendarserver < Intrigue::Ident::Check::Base

def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Application Server"],
            :vendor => "CalendarServer",
            :product => "Calendar and Contacts Server",
            :website => "https://www.calendarserver.org/",
            :match_details => "Calendar and Contacts Server",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server:\ CalendarServer\/(\d+(\.\d+)*(r)?)/i,
            :dynamic_version => lambda {|x| 
                    version = _first_header_capture(x,/^server:\ CalendarServer\/(\d+(\.\d+)*(r)?)/i)
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
