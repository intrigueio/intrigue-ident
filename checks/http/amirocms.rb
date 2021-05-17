module Intrigue
module Ident
module Check
class AmiroCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["CMS"],
        vendor: "Amiro.CMS",
        product: "Amiro.CMS",
        references: ["https://www.amiro.ru/"],
        version: nil,
        match_type: :content_body,
        match_content: /Amiro.CMS/i,
        dynamic_version: nil,
        description: "header match",
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
