module Intrigue
module Ident
module Check
class Aruba < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "operating_system",
        tags: ["Networking", "COTS", "Wireless"],
        vendor: "Aruba Networks",
        product: "Aruba OS",
        version: nil,
        match_type: :content_body,
        match_content:  /arubalp=/,
        description:"Matches an aruba link, generic identifier",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
  
end
end
end
end
