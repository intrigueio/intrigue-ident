module Intrigue
module Ident
module Check
class Rock < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Rock",
        product: "RockCMS",
        references: ["https://www.roadiz.io/"],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content: /rock v([\d\.]+)/i,
          }
        ],
        dynamic_version: lambda { |x| _first_body_capture(x, /rock v([\d\.]+)/i)},
        description: "header match",
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
