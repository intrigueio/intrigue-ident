module Intrigue
module Ident
module Check
class Sucuri < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["SaaS", "WAF", "Security"],
        vendor: "Sucuri",
        product:"Cloudproxy",
        description:"",
        version: nil,
        match_type: :content_headers,
        match_content:  /Server: Sucuri\/Cloudproxy/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["SaaS", "WAF", "Security"],
        vendor: "Sucuri",
        product:"Cloudproxy",
        description:"",
        version: nil,
        match_type: :content_headers,
        match_content:  /^X-Sucuri-ID:.*/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["SaaS", "WAF", "Security"],
        vendor: "Sucuri",
        product:"Cloudproxy",
        description:"",
        version: nil,
        match_type: :content_headers,
        match_content:  /^X-Sucuri-Cache:.*/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end

end
end
end
