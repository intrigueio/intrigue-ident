module Intrigue
module Ident
module Check
class Joomla < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Joomla",
        product:"Joomla!",
        description:"Known Joomla Admin Page",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /files_joomla/i,
          }
        ],
        references: ["https://twitter.com/GreyNoiseIO/status/987547246538391552"],
        paths: [{ path: "#{url}/administrator/manifests/files/joomla.xml", follow_redirects: true } ],
        require_product: "Joomla!",
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Joomla",
        product:"Joomla!",
        description:"generator tag",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_generator,
            match_content:  /^Joomla\! - Open Source Content Management$/i,
          }
        ],
        references: [""],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
