module Intrigue
module Ident
module Check
class BurningBoard < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "WoltLab GmbH",
        product: "WoltLab Burning Board",
        references: ["https://www.woltlab.com/"],
        version: nil,
        match_type: :content_body,
        match_content: /<strong>Burning Board&reg;(.*?)<\/strong>/i,
        dynamic_version: lambda { |x| _first_body_capture(x, /<strong>Burning Board&reg;(.*?)<\/strong>/i)},
        description: "footer match",
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
