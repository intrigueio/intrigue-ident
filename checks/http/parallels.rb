module Intrigue
module Ident
module Check
class Parallels < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative", "Hypervisor", 'Login Panel'],
        vendor:"Parallels",
        product:"Parallels Plesk Panel",
        description: "Parallels Plesk Panel - Title and Body Match",
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
          _first_title_capture(x,/Plesk (?:Obsidian) (\d+(\.\d+)*)/i) 
        },
        dynamic_update: lambda { |x| 
            _first_body_capture(x, /<meta name="plesk-build" content="(\d+(\.\d+)*)/i)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true,
        test_target: ["http://75.119.136.206:8880/"]
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative", "Hypervisor", 'Login Panel'],
        vendor:"Parallels",
        product:"Parallels Plesk Panel",
        description: "Parallels Plesk Panel - Headers Match",
        references: ["https://en.wikipedia.org/wiki/Plesk"],
        match_logic: :all,
        matches: [
          {
            match_type: :content_headers,
            match_content: /server: sw-cp-server/i,
          }
        ],
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        test_target: ["https://70.32.81.77:8443/"]
      }
    ]
  end

end
end
end
end
