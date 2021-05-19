module Intrigue
module Ident
module Check
class Pantheon < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["SaaS", "CMS"],
        vendor: "Pantheon",
        product: "Pantheon",
        website: "https://pantheon.io/",
        description: "x-pantheon-site header",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content:  /x-pantheon-site/,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS", "SaaS"],
        vendor:"Pantheon",
        product:"Patheon",
        website: "https://pantheon.io/",
        description:"styx hostname header",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content:  /^x-pantheon-styx-hostname:/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS", "SaaS"],
        vendor:"Pantheon",
        product:"Patheon",
        website: "https://pantheon.io/",
        description:"styx header",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content:  /^x-styx-req-id:/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }

    ]
  end

end
end
end
end
