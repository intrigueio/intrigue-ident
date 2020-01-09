module Intrigue
module Ident
module Check
class Openvpn < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"OpenVPN",
        :product =>"Access Server",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: OpenVPN-AS$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
