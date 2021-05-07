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
        vendor: "Webmin",
        product: "Webmin",
        description: "page title",
        match_type: :content_body,
        match_content: /<title>Login to Webmin/,
        version: nil,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: MiniServ\/(.*)/i)
        },
        paths: [{ path: "#{url}", follow_redirects: true }],
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
        match_content: /<title>Login to Usermin/,
        version: nil,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server: MiniServ\/(.*)/i)
        },
        paths: [{ path: "#{url}", follow_redirects: true }],
        inference: false,
        issue: "exposed_admin_panel_unauthenticated"
      },

    ]
  end

end
end
end
end
