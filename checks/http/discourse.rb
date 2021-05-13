module Intrigue
module Ident
module Check
class DiscourseCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS"],
        vendor: "Discourse",
        product: "Discourse",
        references: ["https://www.discourse.org/"],
        description: "Discourse - generator page reference",
        version: nil,
        match_type: :content_body,
        match_content: /<meta name="generator" content="Discourse/i,
        dynamic_version: lambda { |x| 
          _first_body_capture(x, /<meta name="generator" content="Discourse (\d+(\.\d+)*)/i)
        },
        dynamic_update: lambda { |x| 
          _first_body_capture(x, /<meta name="generator" content="Discourse (?:(?:\d+(?:\.\d+)*)\.)(\w+)/i)
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
