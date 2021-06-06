module Intrigue
module Ident
module Check
class Jive < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS"],
        vendor: "Jive",
        product:"Platform",
        website: "http://www.jivesoftware.com/",
        description:"jive login page",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_cookies,
            match_content:  /jive.login.ts=/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
  
end
end
end
end
