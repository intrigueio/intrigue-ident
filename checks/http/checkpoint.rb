module Intrigue
module Ident
module Check
class Checkpoint < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        vendor: "Checkpoint",
        tags: ["VPN"],
        product:"GO",
        description:"page title",
        references: ["https://en.wikipedia.org/wiki/Check_Point_GO"],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /<title>Check Point Mobile GO/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        vendor: "Checkpoint",
        tags: ["VPN"],
        product:"GO",
        description:"server header",
        references: ["https://en.wikipedia.org/wiki/Check_Point_GO"],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /server: CPWS/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        vendor: "Checkpoint",
        tags: ["VPN"],
        product:"SSL Network Extender",
        description:"server header",
        references: [],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /server: Check Point SVN foundation/i,
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
