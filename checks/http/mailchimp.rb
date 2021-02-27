module Intrigue
module Ident
module Check
class Mailchimp < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Marketing", "SaaS"],
        vendor: "Mailchimp",
        product:"Mandrill",
        description:"login page",
        match_type: :content_title,
        version: nil,
        match_content:  /Log in to Mandrill/i,
        paths: [ { path: "#{url}", follow_redirects: true } ], 
        inference: false
      }
    ]
  end

end
end
end
end
