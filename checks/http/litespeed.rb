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
        :match_content =>  /server: LiteSpeed/,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/server:.LiteSpeed/) },
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
