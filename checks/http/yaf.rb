module Intrigue
module Ident
module Check
class YafNetCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "YAF.NET",
        product: "YAF",
        references: ["https://www.yetanotherforum.net/"],
        version: nil,
        match_type: :content_body,
        match_content: /Powered by YAF.NET ([\d\.]+)/i,
        dynamic_version: lambda { |x| _first_body_capture(x, /Powered by YAF.NET ([\d\.]+)/i)},
        description: "Header match",
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
