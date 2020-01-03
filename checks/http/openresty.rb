module Intrigue
module Ident
module Check
class OpenResty < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor =>"OpenResty",
        :product =>"OpenResty",
        :match_details =>"server header for OpenResty",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: openresty/i,
        :paths => ["#{url}"],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor =>"OpenResty",
        :product =>"OpenResty",
        :match_details =>"server header for OpenResty with version",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: openresty\/[\d\.]+/i,
        :dynamic_version => lambda {|x| _first_header_capture(x, /server: openresty\/([\d\.]+)/i)},
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
