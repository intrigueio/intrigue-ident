module Intrigue
module Ident
module Check
class HikVision < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["IoT"],
        :vendor => "HikVision",
        :product => "DNVRS",
        :references => ["https://www.hikvision.com/en/products/Turbo-HD-Products/Turbo-HD-Cameras/IOT-Series/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ DNVRS-Webs$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ DNVRS-Webs$/i) },
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
