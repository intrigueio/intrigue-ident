module Intrigue
module Ident
module Check
class FontAwesome < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Font"],
        vendor:"FontAwesome",
        product:"FontAwesome",
        description:"fontawesome css load",
        version: nil,
        match_type: :content_body,
        match_content:/href=\"https:\/\/use.fontawesome.com\/releases\/v([\d\.]+)\/css\/all\.css\"/i,
        dynamic_version: lambda {|d| _first_body_capture(d,/href=\"https:\/\/use.fontawesome.com\/releases\/v([\d\.]+)\/css\/all\.css\"/i)},
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
