module Intrigue
module Ident
module Check
class Sonicwall < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Networking","VPN","Security"],
        vendor:"Sonicwall",
        product:"SonicOS",
        description:"server header",
        references: [
          "https://www.sonicwall.com/en-us/support/technical-documentation/secure-mobile-access-12-0-workplace-user-guide/using-sma-workplace"],
        match_type: :content_headers,
        match_content:  /server: SMA\/.*/i,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: SMA\/([\d\.]+)/i)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        examples: ["server: SMA/12.2"],
        inference: true
      },
      { # duplicate of SMA fingerprint, want to flag SonicOS as well
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Networking","VPN","Security"],
        vendor:"Sonicwall",
        product:"Secure Mobile Access",
        description:"server header",
        references: [
          "https://www.sonicwall.com/en-us/support/technical-documentation/secure-mobile-access-12-0-workplace-user-guide/using-sma-workplace"],
        match_type: :content_headers,
        match_content:  /server: SMA\/.*/i,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: SMA\/([\d\.]+)/i)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        examples: ["server: SMA/12.2"],
        inference: true
      }, 
      { # Sonicwall
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Networking","Security"],
        vendor:"Sonicwall",
        product:"Network Security Appliance",
        description:"server header",
        match_type: :content_headers,
        match_content:  /server: SonicWALL$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }, 
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Networking","Security", "Email"],
        vendor: "Sonicwall",
        product: "Email Security Appliance",
        description: "Content in response body",
        match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /<div id='loginCustomText'/i
            },
            {
              match_type: :content_body,
              match_content: /<td class=\"logonTitle\">Email Security Login<\/td>/i
            }
          ],
        paths: [ { path: "#{url}/index.html", follow_redirects: true } ],
        dynamic_version: lambda { |x|
          _first_body_capture(x,/<div class=\"lefthand\">(.*)<\/div>/i)
        },
        inference: true
      }

    ]
  end

end
end
end
end
