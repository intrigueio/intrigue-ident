module Intrigue
module Ident
module Check
class Wildfly < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["WebServer"],
        vendor: "Wildfly",
        product: "Wildfly",
        references: ["https://wildfly.org/about/"],
        version: nil,
        match_type: :content_headers,
        match_content:  /^server:\ WildFly\/(\d{1,2})$/i,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/^server:\ WildFly\/(\d{1,2})$/i) },
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
