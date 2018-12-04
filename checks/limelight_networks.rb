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
          :vendor => "Limelight Networks",
          :product =>"Edgeprism",
          :match_details =>"server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: EdgePrism.*/i,
          :dynamic_version => lambda { |x|
            _first_header_capture(x,/server: EdgePrism\/(.*)/i,)
          },
          :paths => ["#{url}"]
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CDN"],
          :vendor => "Limelight Networks",
          :product =>"Limelight Networks",
          :match_details =>"server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /server: EdgePrism.*/i,
          :paths => ["#{url}"]
        }
      ]
    end
  end
end
end
end
