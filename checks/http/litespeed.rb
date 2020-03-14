module Intrigue
module Ident
module Check
class LiteSpeed < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Web Server"],
        :vendor => "LiteSpeedTech",
        :product => "LiteSpeed",
        :references => ["https://www.litespeedtech.com/products/litespeed-web-server"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ LiteSpeed$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ LiteSpeed$/i) },
        :hide => false,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
