module Intrigue
module Ident
module Check
class Frontify < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "CMS"],
        vendor: "Frontify",
        product: "Frontify",
        references: ["https://www.frontify.com/en/"],
        version: nil,
        match_type: :content_headers,
        match_content:  /^server:\ frontify$/i,
        dynamic_version: lambda { |x| 
          _first_header_capture(x,/^server:\ frontify$/i) },
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
