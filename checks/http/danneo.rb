module Intrigue
module Ident
module Check
class DanneoCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS"],
        vendor: "Danneo",
        product: "Danneo",
        references: ["http://danneo.ru/"],
        description: "Danneo - generator page reference",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content: /<meta name="generator" content="CMS Danneo/i,
          }
        ],
        dynamic_version: lambda { 
          |x| _first_body_capture(x, /<meta name="generator" content="CMS Danneo (\d+(\.\d+)*)/i)
        },
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
