module Intrigue
module Ident
module Check
class Akamai < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN"],
        :vendor => "Akamai",
        :product => "Akamai",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /The requested URL "&#91;no&#32;URL&#93;", is invalid.<p>/,
        :match_details =>"Akamai Missing Uri",
        :hide => true,
        :paths => ["#{url}"]
      },
      {
        :type => "fingerprint",
        :category => "service",
        :vendor => "Akamai",
        :tags => ["CDN", "WAF"],
        :product => "Akamai",
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
