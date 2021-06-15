module Intrigue
module Ident
module Check
class RbsCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "RBS",
        product: "RBS Change",
        references: ["https://www.rbschange.fr/"],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content: /RBS Change ([\d\.]+)/i,
          }
        ],
        dynamic_version: lambda { |x| _first_body_capture(x, /RBS Change ([\d\.]+)/i)},
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
