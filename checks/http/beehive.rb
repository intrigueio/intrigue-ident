module Intrigue
module Ident
module Check
class Beehive < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Forum system"],
        vendor: "Beehive",
        product: "Beehive Forum",
        references: ["https://www.beehiveforum.co.uk/"],
        version: nil,
        match_type: :content_body,
        match_content: /Beehive Forum (.*\d)/i,
        dynamic_version: lambda { |x|  _first_body_capture(x, /Beehive Forum (.*\d)/i)},
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
