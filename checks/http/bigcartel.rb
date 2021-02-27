module Intrigue
module Ident
module Check
class Bigcartel < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      # Currently match_content too loose
=begin
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "BigCartel",
        product: "BigCartel",
        references: ["https://www.bigcartel.com/"],
        version: nil,
        match_type: :content_body,
        match_content: /Big Cartel/i,
        dynamic_version: nil,
        description: "header match",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
=end
    ]
  end

end
end
end
end
