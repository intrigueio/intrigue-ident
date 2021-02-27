module Intrigue
module Ident
module Check
class OrionTechnology < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Embedded"],
        references: [
          "http://orion-technology.eu/files/products/CMS/iPIMS/iPIMS_USER_MANUAL_Orion.pdf"
        ],
        vendor: "Orion Technology",
        product:"IPIMS",
        description:"unique header",
        version: nil,
        match_type: :content_headers,
        match_content:  /x-ipims-enabled:.*/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
