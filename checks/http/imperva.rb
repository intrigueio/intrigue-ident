module Intrigue
module Ident
module Check
class Incapsula < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Security", "SaaS", "WAF", "Analytics", "Cloud"],
        vendor:"Imperva",
        product:"FlexProtect (Incapsula)",
        website: "https://www.imperva.com/incapsula-moved/",
        description:"Imperva FlexProtect - Headers Match",
        version: nil,
        match_logic: :any,
        matches: [
          {
            match_type: :content_headers,
            match_content:  /^x-iinfo:\ .*$/i,
          },
          {
            match_type: :content_headers,
            match_content:  /^x-cdn: Incapsula$/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["Security", "SaaS", "WAF", "Analytics", "Cloud"],
        vendor:"Imperva",
        product:"FlexProtect (Incapsula)",
        website: "https://www.imperva.com/incapsula-moved/",
        description:"incapsula header (miss)",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /Request unsuccessful. Incapsula incident ID/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        hide: true 
      } , 
      {
        type: "fingerprint",
        category: "service",
        tags: ["Security", "SaaS", "WAF", "Analytics", "Cloud"],
        vendor:"Imperva",
        product:"FlexProtect (Incapsula)",
        website: "https://www.imperva.com/incapsula-moved/",
        description:"incapsula cookie (visid_incap_...)",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_cookies,
            match_content:  /visid_incap_[\d\_]+=/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        hide: true 
      }
    ]
  end

end
end
end
end
