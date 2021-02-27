module Intrigue
module Ident
module Check
class Barracuda < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["WAF"],
        website: "https://www.barracuda.com/products/webapplicationfirewall",
        references: [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        vendor: "Barracuda",
        product:"Application Firewall",
        description:"cookie",
        version: nil,
        match_type: :content_cookies,
        match_content:  /barra_counter_session=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WAF"],
        website: "https://www.barracuda.com/products/webapplicationfirewall",
        references: [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        vendor: "Barracuda",
        product:"Application Firewall",
        description:"cookie",
        version: nil,
        match_type: :content_cookies,
        match_content:  /BNI__BARRACUDA_LB_COOKIE=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WAF"],
        website: "https://www.barracuda.com/products/webapplicationfirewall",
        references: [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        vendor: "Barracuda",
        product:"Application Firewall",
        description:"cookie",
        version: nil,
        match_type: :content_cookies,
        match_content:  /BNI_persistence=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false 
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["WAF"],
        website: "https://www.barracuda.com/products/webapplicationfirewall",
        references: [
          "https://github.com/EnableSecurity/wafw00f"
        ],
        vendor: "Barracuda",
        product:"Application Firewall",
        description:"cookie",
        version: nil,
        match_type: :content_cookies,
        match_content:  /BN[IE]S_.*?=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }, 
      {
        type: "fingerprint",
        category: "application",
        tags: ["WAF"],
        website: "https://www.barracuda.com/products/webapplicationfirewall",
        vendor: "Barracuda",
        product:"Email Security Gateway",
        description:"server",
        version: nil,
        match_type: :content_headers,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: BarracudaHTTP ([\d\.]+)/i,)
        },
        match_content:  /server: BarracudaHTTP ([\d\.]+)/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
  
end
end
end
end
