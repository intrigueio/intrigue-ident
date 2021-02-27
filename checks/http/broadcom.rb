module Intrigue
module Ident
module Check
class Broadcom < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS"],
        vendor: "Broadcom",
        product: "CA API Gateway",
        references: ["https://techdocs.broadcom.com/content/broadcom/techdocs/us/en/ca-enterprise-software/layer7-api-management/api-gateway/9-2/learning-center/about-the-ca-api-gateway.html"],
        version: nil,
        match_type: :content_headers,
        match_content:  /^server:\ CA-API-Gateway\/[\d\.]{1,}$/i,
        dynamic_version: lambda { |x| 
          _first_header_capture(x,/^server:\ CA-API-Gateway\/[\d\.]{1,}$/i) },
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end
end
end
end
end
