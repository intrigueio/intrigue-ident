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
        description: "Pantheon - Headers Match",
        version: nil,
        match_logic: :any,
        matches: [
          {
            match_type: :content_headers,
            match_content:  /x-pantheon-site/,
          },
          {
            match_type: :content_headers,
            match_content:  /^x-pantheon-styx-hostname:/i,
          },
          {
            match_type: :content_headers,
            match_content:  /^x-styx-req-id:/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
    ]
  end

end
end
end
end
