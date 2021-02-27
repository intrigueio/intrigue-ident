module Intrigue
module Ident
module Check
class Hp < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Embedded", "Printer"],
        vendor: "HP",
        product:"HP-ChaiSOE",
        version: "1.0",
        match_type: :content_headers,
        match_content:  /server: HP-ChaiSOE\/1.0/i,
        description:"Generic HP Printer match",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end
  
end
end
end
end
