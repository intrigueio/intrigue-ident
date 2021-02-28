module Intrigue
module Ident
module Check
class Pbworks < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["SaaS"],
        vendor:"PbWorks",
        product:"PbWorks",
        description:"unique link",
        version: nil,
        match_type: :content_body,
        match_content:  /pbworks.com\/shared\/statics/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
