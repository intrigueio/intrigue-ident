module Intrigue
module Ident
module Check
class Anquanbao < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["WAF"],
        website: "",
        vendor: "Anquanbao",
        product: "WAF",
        references: [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /^X-Powered-By-Anquanbao/i,
          }
        ],
        description: "header match",
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
