module Intrigue
module Ident
module Check
class DOSarrest < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN","WAF"],
        :vendor => "DOSarrest",
        :product => "DOSarrest",
        :references => ["https://www.dosarrest.com/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server: DOSarrest/,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/server:.*DOSarrest/i) },
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
