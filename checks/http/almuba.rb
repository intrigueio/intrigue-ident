module Intrigue
module Ident
module Check
class Almubda < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS"],
        vendor: "Almubda",
        product: "Almubda CMS",
        references: [],
        version: nil,
        match_type: :content_body,
        match_content: /Powered by Al Mubda version (\d.*?)<\/a>/i,
        dynamic_version: lambda { |x| _first_body_capture(x, /Powered by Al Mubda version (\d.*?)<\/a>/i)},
        description: "footer match",
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
