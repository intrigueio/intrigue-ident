module Intrigue
module Ident
module Check
class Parallels < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative", "Hypervisor"],
        vendor:"Parallels",
        product:"Parallels Plesk Panel",
        description: "page title",
        references: ["https://en.wikipedia.org/wiki/Plesk"],
        match_logic: :all,
        matches: [
          {
            match_type: :content_title,
            match_content: /Plesk.*?/,
          }
        ],
        version: nil,
        dynamic_version: lambda { |x| 
          _first_title_capture(x,/Plesk (.*?)/) },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative", "Hypervisor"],
        vendor:"Parallels",
        product:"Parallels Plesk Panel",
        description: "server header",
        references: ["https://en.wikipedia.org/wiki/Plesk"],
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /server: sw-cp-server/,
          }
        ],
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
