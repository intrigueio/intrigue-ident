module Intrigue
module Ident
module Check
class Adeptia < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["COTS", "Web Server"],
        vendor: "Adeptia",
        product: "Connect",
        website: "https://adeptia.com/products/Adeptia-Connect-enterprise-integration",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /server: Adeptia/i,
          }
        ],
        description: "header match",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false  
      }
    ]
  end


end
end
end
end
