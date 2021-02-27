module Intrigue
module Ident
module Check
class SimpleMachineForum < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Forum builder"],
        vendor: "Simple Machine Forum",
        product: "SMF",
        references: ["https://www.simplemachines.org/"],
        version: nil,
        match_type: :content_body,
        match_content: /SMF ([\d\.]+s)/i,
        dynamic_version: lambda { |x| _first_body_capture(x, /SMF ([\d\.]+)/i)},
        description: "body match",
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
