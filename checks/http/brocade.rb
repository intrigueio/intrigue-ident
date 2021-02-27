module Intrigue
module Ident
module Check
class Brocade < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "hardware",
        tags: ["Appliance","Networking"],
        vendor: "Brocade",
        product: "ICX7250-24",
        version: nil,
        match_type: :content_body,
        match_content:  /Images\/uicx_7250_24_gfphdr_login1.gif/,
        description:"specific image",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "operating_system",
        tags: ["Appliance","Networking"],
        vendor: "Brocade",
        product: "Fabric OS",
        version: nil,
        match_type: :content_body,
        match_content: /<td><img src=\"Images\/brocade_logo_no_text.gif\">/,
        description:"specific image",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
end
end
end
end
