module Intrigue
module Ident
module Check
class PalletsProjects < Intrigue::Ident::Check::Base
  
  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["WSGI", "Development"],
        vendor: "Werkzeug",
        product: "Werkzeug",
        website: "https://werkzeug.palletsprojects.com/",
        description: "Werkzeug WSGI web application library header",
        version: nil,
        match_type: :content_headers,
        match_content: /^server: Werkzeug\/(\d+\.\d+\.\d+)\ Python\/(\d+\.\d+\.\d+)$/i,
        dynamic_version: lambda {|x| 
          version = _first_header_capture(x,/^server: Werkzeug\/(\d+\.\d+\.\d+)\ Python\/(\d+\.\d+\.\d+)$/i)
        },
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["Development", "Panel"],
        vendor: "Pallets Projects",
        product: "Werkzeug",
        website: "https://werkzeug.palletsprojects.com/",
        references: [],
        version: nil,
        match_type: :content_title,
        match_content: /^Console \/\/ Werkzeug Debugger$/i,
        description: "title",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        issue: "exposed_werkzeug_debugger"
      },
      { # same check as above but at /console if we detected python
        type: "fingerprint",
        category: "service",
        tags: ["Development", "Panel"],
        vendor: "Pallets Projects",
        product: "Werkzeug",
        website: "https://werkzeug.palletsprojects.com/",
        references: [],
        version: nil,
        match_type: :content_title,
        match_content: /^Console \/\/ Werkzeug Debugger$/i,
        description: "title, at /console",
        hide: false,
        paths: [{ path: "#{url}/console", follow_redirects: true } ],
        require_product: "Python",
        inference: false,
        issue: "exposed_werkzeug_debugger"
      },
      {
        type: "fingerprint",
        category: "service",
        tags: ["Development", "Panel"],
        vendor: "Pallets Projects",
        product: "Werkzeug",
        website: "https://werkzeug.palletsprojects.com/",
        references: [],
        version: nil,
        match_type: :content_body,
        match_content: /In this console you can execute Python expressions in the context/i,
        description: "unique body string",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        issue: "exposed_werkzeug_debugger"
      }
    ]
  end
  
end
end
end
end
