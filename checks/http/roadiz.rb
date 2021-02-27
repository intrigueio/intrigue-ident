module Intrigue
module Ident
module Check
class RoadizCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Roadiz",
        product: "Roadiz",
        references: ["https://www.roadiz.io/"],
        description: "Roadiz - generator page reference",
        version: nil,
        match_type: :content_body,
        match_content: /<meta name="generator" content="Roadiz/i,
        dynamic_version: lambda { |x| 
          _first_body_capture(x, /<meta name="generator" content="Roadiz (?:beta|master|develop)\s*(\d+(\.\d+)*)/i)
        },
        dynamic_update: lambda { |x| 
          _first_body_capture(x, /<meta name="generator" content="Roadiz (beta|master|develop)/i)
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
