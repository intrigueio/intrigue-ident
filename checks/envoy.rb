module Intrigue
module Ident
module Check
class Envoy < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Networking", "Proxy"],
        :vendor => "Envoy",
        :product => "Envoy",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: envoy$/,
        :match_details =>"server header",
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
end
end
end
end
