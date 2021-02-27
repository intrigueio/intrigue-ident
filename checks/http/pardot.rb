
module Intrigue
module Ident
module Check
class Pardot < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Marketing", "Javascript"],
        vendor:"Pardot",
        product:"Pardot",
        description:"Pardot",
        version: nil,
        match_type: :content_cookies,
        match_content:  /pardot/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["Marketing", "Javascript"],
        vendor: "Pardot",
        product: "Pardot",
        references: ["https://www.pardot.com/"],
        version: nil,
        match_type: :content_headers,
        match_content:  /server: pardotserver/i,
        dynamic_version: lambda { |x| 
          _first_header_capture(x,/server:.*pardotserver/i) },
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
