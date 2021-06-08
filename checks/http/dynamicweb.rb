module Intrigue
module Ident
module Check
class DynamicWeb < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Dynamicweb",
        product: "Dynamicweb",
        references: ["https://www.dynamicweb.com/"],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content: /<meta name="generator" content="Dynamicweb.*" \/>/i,
          }
        ],
        dynamic_version: lambda { |x| 
            version = _first_body_capture(x, /<meta name="generator" content="Dynamicweb (\d+(\.\d+)*)" \/>/i)
        },
        description: "Dynamicweb - generator page reference",
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
