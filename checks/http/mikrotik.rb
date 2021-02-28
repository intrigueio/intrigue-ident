module Intrigue
module Ident
module Check
class Mikrotik < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "hardware",
        tags: ["Embedded", "Networking"],
        vendor:"Mikrotik",
        product:"RouterOS",
        description: "page title",
        match_type: :content_body,
        match_content:  /<title>RouterOS router configuration page/,
        version: nil,
        dynamic_version: lambda { |x| 
          _first_body_capture(x,/<h1>RouterOS v(.*?)<\/h1>/) 
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "hardware",
        tags: ["Embedded", "Networking"],
        vendor:"Mikrotik",
        product:"RouterOS",
        description: "server header",
        match_type: :content_headers,
        match_content:  /^server: Mikrotik HttpProxy$/,
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      # 
    ]
  end

end
end
end
end
