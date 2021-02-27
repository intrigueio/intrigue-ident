module Intrigue
module Ident
module Check
class WordpressIthemes < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { # https://nvd.nist.gov/vuln/detail/CVE-2018-12636
        type: "fingerprint",
        category: "application",
        tags: ["Wordpress Plugin"],
        vendor:"iThemes",
        product:"Security",
        references: ["https://ithemes.com/security/"],
        description: "js load string",
        match_type: :content_body,
        match_content:  /blankshield\/blankshield\.min\.js\?ver=/i,
        dynamic_version: lambda { |x|
          _first_body_capture(x,/blankshield\/blankshield\.min\.js\?ver=(\d+)/i)
        },
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        require_product: "Wordpress",
        inference: false
      },
      { # https://nvd.nist.gov/vuln/detail/CVE-2018-12636
        type: "fingerprint",
        category: "application",
        tags: ["Wordpress Plugin"],
        vendor:"iThemes",
        product:"Security",
        references: ["https://ithemes.com/security/"],
        description: "js load string",
        match_type: :content_body,
        match_content:  /block-tabnapping\.min\.js\?ver=/i,
        dynamic_version: lambda { |x|
          _first_body_capture(x,/block-tabnapping\.min\.js\?ver=(\d+)/i)
        },
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        require_product: "Wordpress",
        inference: false
      }
    ]
  end

end
end
end
end
