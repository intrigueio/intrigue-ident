module Intrigue
module Ident
module Check
class Jetty < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS", "SaaS"],
        vendor: "Jetty",
        product: "Communication Management System",
        description: "unique body string",
        version: nil,
        match_type: :content_body,
        match_content:  /title=\"Jetty\">Proudly powered by Jetty<\/a>/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
