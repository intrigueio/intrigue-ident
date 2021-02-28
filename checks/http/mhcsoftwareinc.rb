module Intrigue
module Ident
module Check
class MHCSoftwareInc < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS", "WebServer"],
        vendor: "MHCSoftwareInc",
        product: "Document Self-Service",
        references: ["https://www.mhcsoftwareinc.com/platform/application-suites/document-self-service/"],
        version: nil,
        match_type: :content_headers,
        match_content:  /^server:\ DSS WebServer\/(\d\.\d)$/i,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/^server:\ DSS WebServer\/(\d\.\d)$/i) },
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
