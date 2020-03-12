module Intrigue
module Ident
module Check
class Leadpages < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Hosting", "CDN"],
        :vendor => "Leadpages",
        :product => "Leadpages",
        :references => ["https://www.leadpages.net/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: leadpages/i,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/server:.*leadpages/i) },
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
