module Intrigue
module Ident
module Check
class Telerik < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Web Framework"],
        vendor: "Telerik",
        product: "UI",
        description: "version in body (ex: Version=10.2.6653.0)",
        website: "https://www.telerik.com/",
        version: nil,
        match_type: :content_body,
        match_content:  /Telerik.Web.UI/,
        dynamic_version: lambda { |x|  
          _first_body_capture x, /Telerik.Sitefinity.Resources, Version=([\d\.]+),/ },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Web Framework"],
        vendor: "Telerik",
        product: "Sitefinity CMS",
        description: "Telerik Sitefinity is an ASP.NET 2.0-based Content Management System (CMS)",
        website: "https://www.sitefinity.com/",
        version: nil,
        match_type: :content_body,
        match_content:  /Telerik.Sitefinity.Resources/,
        dynamic_version: lambda { |x|  
          _first_body_capture x, /Version=([\d\.]+),/ },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Database","COTS"],
        vendor: "Telerik",
        product: "Sitefinity CMS",
        description: "Detect Telerik via a meta generator tag",
        website: "https://www.sitefinity.com/",
        version: nil,
        match_type: :content_body,
        match_content:  /<meta\ name=\"Generator\"\ content=\"Sitefinity/,
        dynamic_version: lambda { |x| 
          _first_body_capture x, /<meta name=\"Generator\" content=\"Sitefinity ([\d\.]+).*\ \/>/ },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end

end
end
end
end
