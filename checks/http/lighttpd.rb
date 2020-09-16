module Intrigue
module Ident
module Check
class Lighttpd < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Lighttpd",
        :product =>"Lighttpd",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: lighttpd/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/server: lighttpd\/(.*)/i,)
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :examples => ["lighttpd/1.4.23-devel-Unversioned directory"],
        :inference => true
      }
    ]
  end
  
end
end
end
end
