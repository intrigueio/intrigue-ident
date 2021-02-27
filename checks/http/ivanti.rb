module Intrigue
module Ident
module Check
class Ivanti < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "Appliance", "Administrative"],
        vendor: "Ivanti",
        product:"LANDESK Appliance",
        description:"matched title",
        match_type: :content_body,
        version: nil,
        references: ["https://community.ivanti.com/community/all-products/systems/cloudservices"],
        match_content:  /<title>LANDESK\(R\) Cloud Services Appliance/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
  
end
end
end
end
