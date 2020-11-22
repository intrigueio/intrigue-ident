module Intrigue
module Ident
module Check
class OpenResty < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor =>"OpenResty",
        :product =>"OpenResty",
        :match_details =>"server header for OpenResty",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: openresty/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["WebServer"],
        :vendor =>"OpenResty",
        :product =>"OpenResty",
        :match_details =>"server header for OpenResty with version",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: openresty\/[\d\.]+/i,
        :dynamic_version => lambda {|x| _first_header_capture(x, /server: openresty\/([\d\.]+)/i)},
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
