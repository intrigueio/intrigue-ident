
module Intrigue
module Ident
module Check
class Readmeio < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Javascript", "SaaS", "Support"],
        vendor:"Readme.io",
        product:"Readme.io",
        description:"js load string",
        version: nil,
        match_type: :content_body,
        match_content:  /cdn.readme.io\/js\/bundle-hub2.js/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["SaaS", "API"],
        vendor:"Readme.io",
        product:"Readme.io",
        description:"readme.io api manager",
        version: nil,
        match_type: :content_body,
        match_content:  /\.hub-api \.api-definition/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["SaaS", "API"],
        vendor:"Readme.io",
        product:"Readme.io",
        description:"readme.io string",
        version: nil,
        match_type: :content_body,
        match_content:  /id=\"hub-me\"/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
      
    ]
  end

end
end
end
end