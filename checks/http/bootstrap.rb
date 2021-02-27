module Intrigue
module Ident
module Check
class Bootstrap < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Web Framework"],
        vendor: "Bootstrap",
        product: "Bootstrap",
        description:"boostrap css",
        version: nil,
        match_type: :content_body,
        match_content:  /bootstrap.min.css/,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Javascript"],
        vendor: "Twitter",
        product: "Bootstrap",
        description:"version in js file",
        match_type: :content_body,
        match_content:  /\s+\* Bootstrap v\d+\.\d+\.\d+ \(https:\/\/getbootstrap.com\/\)/i,
        dynamic_version: lambda {|x| 
          _first_body_capture(x,/\s+\* Bootstrap v(\d+\.\d+\.\d+) \(https:\/\/getbootstrap.com\/\)/i) },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end

end
end
end
end
