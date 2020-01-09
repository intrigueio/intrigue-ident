module Intrigue
module Ident
module Check
class Bomgar < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "IT Support"],
        :vendor => "Bomgar",
        :product => "Remote Support",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server: Bomgar$/,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
