module Intrigue
module Ident
module Check
class Banu < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server","Proxy Server"],
        :vendor => "Banu",
        :product =>"Tinyproxy",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: tinyproxy/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/server: tinyproxy\/(.*)/i,)
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      :inference => true
      }
    ]
  end
end

end
end
end
