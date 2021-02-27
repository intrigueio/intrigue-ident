module Intrigue
module Ident
module Check
class Ergon < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["WAF"],
        website: "https://www.airlock.com/en/products/airlock-waf/",
        vendor: "Ergon",
        product: "Airlock",
        references: [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        version: nil,
        match_type: :content_cookies,
        match_content: /AL[_-]?(SESS|LB)=/i,
        description: "cookie match",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
end
end
end
end
