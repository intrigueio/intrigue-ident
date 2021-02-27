
module Intrigue
module Ident
module Check
class SouthRiver < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { # check may be too broad, there is a string in the body that
        # is more specific to MFT
        type: "fingerprint",
        category: "application",
        tags: ["COTS"],
        vendor:"SouthRiver",
        product:"Cornerstone MFT",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content:  /server: SouthRiver\/1.0/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      { # check may be too broad, there is a string in the body that
        # is more specific to MFT
        type: "fingerprint",
        category: "application",
        tags: ["COTS"],
        vendor:"SouthRiver",
        product:"Cornerstone MFT",
        description:"unique body string",
        version: nil,
        match_type: :content_body,
        match_content:  /title="Cornerstone MFT" target="_blank"/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
