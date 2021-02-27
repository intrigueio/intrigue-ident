module Intrigue
module Ident
module Check
class Allegro < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["WebServer","Embedded"],
        vendor: "Allegro",
        product: "RomPager",
        version: nil,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/Allegro-Software-RomPager\/(.*)$/i) },
        match_type: :content_headers,
        match_content:  /server:\ Allegro-Software-RomPager/,
        description:"server header",
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end
end
end
end
end
