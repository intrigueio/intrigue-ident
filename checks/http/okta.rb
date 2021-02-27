module Intrigue
module Ident
module Check
class Okta < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["IAM", "SaaS", "Security"],
        vendor:"Okta",
        product:"Okta",
        description:"okta header",
        version: nil,
        match_type: :content_headers,
        match_content:  /x-okta-backend/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["IAM", "SaaS", "Security"],
        vendor:"Okta",
        product:"Okta",
        description:"okta header",
        version: nil,
        match_type: :content_headers,
        match_content:  /x-okta-request-id/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["IAM", "SaaS", "Security"],
        vendor:"Okta",
        product:"Okta",
        description:"okta container div",
        version: nil,
        match_type: :content_body,
        match_content:  /class="auth okta-container">/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
