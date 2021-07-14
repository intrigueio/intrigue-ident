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
        product: "Application Firewall",
        description: "Barracuda Application Firewall - Cookie Match",
        version: nil,
        match_logic: :any,
        matches: [
          {
            match_type: :content_cookies,
            match_content: /barra_counter_session=/i,
          },
          {
            match_type: :content_cookies,
            match_content: /BNI__BARRACUDA_LB_COOKIE=/i,
          },
          {
            match_type: :content_cookies,
            match_content: /BNI_persistence=/i,
          },
          {
            match_type: :content_cookies,
            match_content: /BN[IE]S_.*?=/i,
          }
        ],
        paths: [{ path: "#{url}", follow_redirects: true }],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["WAF", "SaaS"],
        website: "https://www.barracuda.com/products/webapplicationfirewall",
        vendor: "Barracuda",
        product: "Email Security Gateway",
        description: "server",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /server: BarracudaHTTP ([\d\.]+)/i,
          }
        ],
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: BarracudaHTTP ([\d\.]+)/i,)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end
  
end
end
end
end
