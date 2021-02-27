module Intrigue
module Ident
module Check
class Symantec < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["Security","Javascript"],
        vendor:"Symantec",
        product:"Norton Secured Seal",
        references: ["https://www.websecurity.symantec.com/install-norton-secured-seal"],
        description:"security seal",
        match_type: :content_body,
        match_content: /seal\.verisign\.com\/getseal\?host_name=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
