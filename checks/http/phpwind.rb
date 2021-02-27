module Intrigue
module Ident
module Check
class PhpWind < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Phpwind",
        product: "Phpwind",
        references: ["https://www.phpwind.net/"],
        version: nil,
        match_type: :content_body,
        match_content: /phpwind ([\d\.]+)/i,
        dynamic_version: lambda { |x| _first_body_capture(x, /phpwind ([\d\.]+)/i)},
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
