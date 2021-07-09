module Intrigue
module Ident
module Check
class Auth0 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["IAM", "MFA", "SaaS", "Security"],
        vendor: "Auth0",
        product: "Auth0",
        references: [],
        version: nil,
        match_logic: :any,
        matches: [
          {
            match_type: :content_body,
            match_content: /window.auth0AnalyticsOptions/i,
          },
          {
            match_type: :content_body,
            match_content: /\/auth0/i,
          }
        ],
        description: "Auth0 - Body Match",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
    ]
  end
  
end
end
end
end
