module Intrigue
module Ident
module Check
class Imunify360 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Web Server","Proxy Server"],
        :vendor => "CloudLinux",
        :product => "Imunify360",
        :references => ["https://www.imunify360.com/blog/webshield-introduction-for-server-administrators"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ imunify360-webshield\/[\d\.]{1,}$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ imunify360-webshield\/[\d\.]{1,}$/i) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end
end
end
end
end
