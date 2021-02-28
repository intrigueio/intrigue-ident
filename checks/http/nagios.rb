module Intrigue
module Ident
module Check
class Nagios < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Administrative","Development"],
        vendor: "Nagios",
        product:"Nagios",
        description:"Nagios",
        version: nil,
        match_type: :content_headers,
        match_content:  /nagios/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
