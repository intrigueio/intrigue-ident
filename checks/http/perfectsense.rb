module Intrigue
module Ident
module Check
class Perfectsense < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Application Server"],
        :vendor => "PerfectSense",
        :product =>"Brightspot",
        :match_details =>"server header",
        :version => nil,
        :references => [],
        :match_type => :content_headers,
        :match_content =>  /x-powered-by: Brightspot/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
  
end
end
end
end
