module Intrigue
module Ident
module Check
class AgilityCMS < Intrigue::Ident::Check::Base


  def generate_checks(url)
    [
=begin
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Agility",
        product: "AgilityCMS",
        references: ["https://agilitycms.com/"],
        version: nil,
        match_type: :content_body,
        match_content: /Agility CMS/i,
        dynamic_version: lambda { |x|  _first_body_capture(x, /Agility CMS (\d+)/i)},
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
