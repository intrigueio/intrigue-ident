module Intrigue
module Ident
module Check
class Netlify < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["PaaS", "CDN"],
        vendor: "Netlify",
        product:"Netlify",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content:  /server: Netlify/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["PaaS", "CDN"],
        vendor: "Netlify",
        product:"Netlify",
        description:"x-nf-request-id header",
        version: nil,
        match_type: :content_headers,
        match_content:  /^x-nf-request-id:.*$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
