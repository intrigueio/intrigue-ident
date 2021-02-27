module Intrigue
module Ident
module Check
class Crowdstrike < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Security", "SaaS"],
        vendor: "Crowdstrike",
        product: "Falcon",
        references: [""],
        version: nil,
        match_type: :content_cookies,
        match_content: /domain\=\.falcon-sandbox\.com/i,
        description: "Falcon Sandbox cookie",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
end
end
end
end
