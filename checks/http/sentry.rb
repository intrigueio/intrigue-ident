module Intrigue
module Ident
module Check
class Sentry < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Javascript", "SaaS", "APM"],
        vendor:"Sentry",
        product:"Sentry",
        description:"sentry init js",
        version: nil,
        match_type: :content_body,
        match_content:  /Sentry.init\({dsn:/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
