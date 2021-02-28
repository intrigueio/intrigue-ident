module Intrigue
module Ident
module Check
class Smartling < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { # Magnolia CMS?
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "CMS"],
        vendor:"Smartling",
        product:"Smartling",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content: /^x-server: Smartling$/i, 
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
