module Intrigue
module Ident
module Check
class Nodejs < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server", "Language"],
        vendor:"Node.js",
        product:"Node.js",
        description:"unique error page",
        version: nil,
        match_type: :content_body,
        match_content:  /^<pre>Cannot GET \/doesntexist-123<\/pre>$/i,
        paths:[{ path: "#{url}/doesntexist-123", follow_redirects: true } ],
        inference: false
      }, 
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server", "Language"],
        vendor:"Node.js",
        product:"Node.js",
        description:"x-powered-by (node.js)",
        version: nil,
        match_type: :content_headers,
        match_content:  /^x-powered-by: nodejs$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server", "Language"],
        vendor:"Node.js",
        product:"Node.js",
        description:"server header (node.js)",
        version: nil,
        match_type: :content_headers,
        match_content:  /^server: nodejs$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server", "Language"],
        vendor:"Node.js",
        product:"Node.js",
        description:"unique error page (sails)",
        version: nil,
        match_type: :content_cookies,
        match_content:  /sails.sid=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server", "Language"],
        vendor:"Node.js",
        product:"Node.js",
        description:"x-powered-by (sails.js)",
        version: nil,
        match_type: :content_headers,
        match_content:  /^x-powered-by: Sails$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Web Framework"],
        vendor:"Sails.js",
        product:"Sails",
        description:"unique error page",
        version: nil,
        match_type: :content_cookies,
        match_content:  /sails.sid=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Web Framework"],
        vendor:"Sails.js",
        product:"Sails",
        description:"x-powered-by header",
        version: nil,
        match_type: :content_headers,
        match_content:  /^x-powered-by: Sails$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
