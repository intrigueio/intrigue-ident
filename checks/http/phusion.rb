module Intrigue
module Ident
module Check
class Phusion < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "Phusion",
        product:"Passenger",
        description:"x-powered-by header",
        version: nil,
        match_type: :content_headers,
        match_content:  /^x-powered-by: Phusion Passenger.*$/,
        dynamic_version: lambda{|x| 
          _first_header_capture(x,/x-powered-by: Phusion Passenger (.*)/i) },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "Phusion",
        product:"Passenger",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content:  /^server:.*Phusion Passenger.*$/,
        dynamic_version: lambda{|x| 
          _first_header_capture(x,/^server:.*Phusion Passenger\ ([\d\.]*).*/i) },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Application Server"],
        vendor: "Phusion",
        product:"Passenger",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content:  /^server:.*Phusion_Passenger.*$/,
        dynamic_version: lambda{|x| 
          _first_header_capture(x,/^server:.*Phusion_Passenger\/([\w\d\.\-]*)\s.*$/i) },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end

end
end
end
end
