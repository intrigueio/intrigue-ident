module Intrigue
module Ident
module Check
class Jforum < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "Development"],
        vendor: "Jforum",
        product: "Jforum",
        description: "cookie",
        version: "2.x",
        match_type: :content_cookies,
        match_content:  /jforum-secure-sso=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
