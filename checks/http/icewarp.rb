module Intrigue
module Ident
module Check
class IceWarp < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Productivity", "COTS", "Email"],
        :vendor => "IceWarp",
        :product => "IceWarp",
        :references => ["https://www.icewarp.com/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ IceWarp\/(\d{1,}\.\d{1,}\.\d{1,})$/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ IceWarp\/(\d{1,}\.\d{1,}\.\d{1,})$/i) },
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end
end
end
end
end
