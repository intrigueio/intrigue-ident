module Intrigue
module Ident
module Check
class Webflow < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS", "SaaS"],
        vendor:"Webflow",
        product:"Webflow",
        description:"body string",
        references: ["https://webflow.com"],
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /data-wf-page=\"/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS", "SaaS"],
        vendor:"Webflow",
        product:"Webflow",
        description:"missing page body string",
        references: ["https://webflow.com"],
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /w-section content-wrapper.*The page you are looking for doesn't exist or has been moved./mi,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        hide: true,
        inference: false
      }


      
    ]
  end

end
end
end
end
