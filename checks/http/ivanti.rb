module Intrigue
module Ident
module Check
class Ivanti < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Appliance", "Administrative"],
        :vendor => "Ivanti",
        :product =>"LANDESK Appliance",
        :match_details =>"matched title",
        :match_type => :content_body,
        :version => nil,
        :references => ["https://community.ivanti.com/community/all-products/systems/cloudservices"],
        :match_content =>  /<title>LANDESK\(R\) Cloud Services Appliance/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
  
end
end
end
end
