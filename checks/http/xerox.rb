module Intrigue
module Ident
module Check
class Xerox < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Embedded","Printer"],
        vendor: "Xerox",
        product: "WorkCentre Printer",
        references: [],
        description:"title",
        match_logic: :all,
        matches: [
          {
            match_type: :content_title,
            match_content: /^CentreWare Internet Services$/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false, 
        issue: "exposed_printer_control_panel"
      }
    ]
  end

end
end
end
end
