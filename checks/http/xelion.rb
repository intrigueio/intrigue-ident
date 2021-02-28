module Intrigue
module Ident
module Check
class Xelion < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Telephony"],
        vendor:"Xelion",
        product:"Phone System",
        references: ["https://www.xelion.com/en/"],
        description:"title",
        match_type: :content_title,
        match_content:  /Xelion Phone System/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
