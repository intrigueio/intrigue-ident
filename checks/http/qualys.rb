
module Intrigue
  module Ident
  module Check
  class Qualys < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Security"],
          vendor:"Qualys",
          product:"QualysGuard",
          description:"custom server header",
          version: nil,
          match_type: :content_headers,
          match_content:  /^server: Qualys$/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "service",
          tags: ["Security"],
          vendor:"Qualys",
          product:"QualysGuard",
          description:"custom server header",
          version: nil,
          match_type: :content_headers,
          match_content:  /^server: qweb\/.*$/i,
          dynamic_version: lambda { |x| _first_header_capture(x, /^server: qweb\/(.*)$/i)},
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: true
        },
        {
          type: "fingerprint",
          category: "service",
          tags: ["Security"],
          vendor:"Qualys",
          product:"Qualys Mobility",
          description:"custom server header",
          version: nil,
          match_type: :content_headers,
          match_content:  /^server: QMProprietary$/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "service",
          tags: ["Security"],
          vendor:"Qualys",
          product:"Qualys Mobility",
          description:"custom server header",
          version: nil,
          match_type: :content_cookies,
          match_content:  /QualysSession=/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        }
      ]
    end
  
  end
  end
  end
  end
  