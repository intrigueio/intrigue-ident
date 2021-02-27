module Intrigue
module Ident
module Check
class Rapid7 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["SaaS"],
        vendor:"Rapid7",
        product:"Logentries",
        description:"server header",
        references: [],
        match_type: :content_headers,
        match_content:  /server: th3 c4k3 is 4 l13\.$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
