module Intrigue
module Ident
module Check
class Redmine < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      { 
        type: "fingerprint",
        category: "operating_system",
        tags: ["OS"],
        vendor:"Redmine",
        product:"Redmine",
        description:"redmine cookie",
        match_type: :content_cookies,
        match_content:  /_redmine_session=/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      { 
        type: "fingerprint",
        category: "operating_system",
        tags: ["OS"],
        vendor:"Redmine",
        product:"Redmine",
        description:"redmine title",
        match_type: :content_title,
        match_content:  /^Redmine$/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
