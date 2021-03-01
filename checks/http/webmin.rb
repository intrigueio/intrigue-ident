module Intrigue
module Ident
module Check
class Webmin < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative"],
        vendor:"Webmin",
        product:"Webmin",
        description: "miniserv server",
        match_type: :content_headers,
        references: [],
        match_content: /server: MiniServ/i,
        version: nil,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: MiniServ\/(.*)/i)
        },
        dynamic_hide: lambda{ |x|
          # hide if it is usermin and not webmin
          return true if _first_body_match(x,/<title>Login to Usermin/)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative"],
        vendor:"Webmin",
        product:"Webmin",
        description: "page title",
        match_type: :content_body,
        references: [],
        match_content: /<title>Login to Webmin/,
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        issue: "exposed_admin_panel_unauthenticated"
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Administrative"],
        vendor: "Usermin",
        product: "Usermin",
        description: "page title",
        match_type: :content_body,
        references: [],
        match_content: /<title>Login to Usermin/,
        version: nil,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: MiniServ\/(.*)/i)
        },
        issue: "exposed_admin_panel_unauthenticated"
      },

    ]
  end

end
end
end
end
