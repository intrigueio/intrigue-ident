module Intrigue
module Ident
module Check
class Intercom < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Javascript", "Support"],
        vendor:"Intercom",
        product:"Intercom",
        description:"js load string",
        version: nil,
        match_type: :content_body,
        match_content:  /ic=w.Intercom;/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end