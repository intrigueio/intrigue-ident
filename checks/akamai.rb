module Intrigue
module Ident
module Check
class Akamai < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "service",
        :vendor => "Akamai",
        :product => "CDN",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /The requested URL "&#91;no&#32;URL&#93;", is invalid.<p>/,
        :match_details =>"Akamai Missing Uri",
        :hide => true,
        :paths => ["#{url}"]
      },
      {
        :type => "service",
        :vendor => "Akamai",
        :product => "CDN",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /x-akamai-transformed:.*/,
        :match_details =>"Akamai transformed header",
        :hide => false,
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
