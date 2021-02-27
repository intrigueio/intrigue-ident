module Intrigue
module Ident
module Check
class Synacor < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Productivity","COTS"],
        vendor:"Synacor",
        product:"Zimbra Collaboration Suite",
        description:"login page for zimbra",
        match_type: :content_title,
        match_content:  /Zimbra Web Client Sign In/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
