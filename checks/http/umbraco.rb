module Intrigue
module Ident
module Check
class Umbraco < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Umbraco",
        product: "Umbraco",
        references: ["https://umbraco.com/"],
        version: nil,
        match_type: :content_body,
        match_content: /umbraco/,
        description: "body match",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end
  
end
end
end
end
