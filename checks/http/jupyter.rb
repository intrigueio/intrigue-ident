module Intrigue
module Ident
module Check
class Jupyter < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Development"],
        vendor: "Jupyter",
        product:"Notebook",
        description:"matched jupyterhub header",
        match_type: :content_headers,
        version: nil,
        dynamic_version: lambda { |x| _first_header_capture(x,/^x-jupyterhub-version: (.*)$/) },
        match_content:  /x-jupyterhub-version:/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Development"],
        vendor: "Jupyter",
        product:"Notebook",
        description:"unique body string: data-notebook-path",
        match_type: :content_body,
        match_content:  /data-notebook-path:/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["COTS","Development"],
        vendor: "Jupyter",
        product:"Notebook",
        description:"unique title",
        match_type: :content_title,
        match_content:  /Home Page - Select or create a notebook/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
      

    ]
  end
  
end
end
end
end
