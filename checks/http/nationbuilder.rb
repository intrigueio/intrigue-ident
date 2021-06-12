module Intrigue
module Ident
module Check
class NationBuilder < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS"],
        website: "https://nationbuilder.com/",
        vendor: "NationBuilder",
        product: "NationBuilder",
        references: [],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content: />Created with NationBuilder<\/a>/i,
          }
        ],
        description: "created by string",
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
