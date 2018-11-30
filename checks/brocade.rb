module Intrigue
module Ident
module Check
class Brocade < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "hardware",
        :tags => ["Appliance","Networking"],
        :vendor => "Brocade",
        :product => "ICX7250-24",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /Images\/uicx_7250_24_gfphdr_login1.gif/,
        :match_details =>"specific image",
        :paths => ["#{url}"]
      },
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Appliance","Networking"],
        :vendor => "Brocade",
        :product => "Fabric OS",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<td><img src=\"Images\/brocade_logo_no_text.gif\">/,
        :match_details =>"specific image",
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
