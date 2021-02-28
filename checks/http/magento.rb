module Intrigue
module Ident
module Check
class Magento < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Payments"],
        vendor: "Magento",
        product:"Magento",
        description:"cookie",
        match_type: :content_body,
        version: nil,
        match_content: /Mage.Cookies.path/i,
        paths: [ { path: "#{url}", follow_redirects: true } ], 
        inference: false
      }, 
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Payments"],
        vendor: "Magento",
        product:"Magento",
        description:"cache header",
        match_type: :content_headers,
        version: nil,
        match_content:  /^x-magento-cache-debug:.*$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ], 
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Payments"],
        vendor: "Magento",
        product:"Magento",
        description:"cacheing header",
        match_type: :content_headers,
        version: nil,
        match_content:  /^x-magento-cache-control:.*$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ], 
        inference: false
      },    
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Payments"],
        vendor: "Magento",
        product:"Magento",
        description:"tags header",
        match_type: :content_headers,
        version: nil,
        match_content:  /^x-magento-tags:.*$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ], 
        inference: false
      }, 
      { # also... /skin/frontend/default/default/css/styles.css
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Payments"],
        vendor: "Magento",
        product:"Magento",
        description:"cookies js file",
        match_type: :content_body,
        version: nil,
        match_content:  /old school cookie functions grabbed off the web/i,
        paths: [{ path: "#{url}/js/mage/cookies.js", follow_redirects: true } ], 
        require_product: "Magento",
        inference: false
      },           
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Payments"],
        vendor: "Magento",
        product:"Magento",
        description:"release notes file",
        match_type: :content_body,
        version: nil,
        match_content:  /==== [\d\.]+ ====/i,
        dynamic_version: lambda{ |x| _first_body_capture(x, /==== ([\d\.]+) ====/i)},
        paths: [{ path: "#{url}/RELEASE_NOTES.txt", follow_redirects: true } ],
        require_product: "Magento",
        inference: false
      }              
    ]
  end

end
end
end
end
