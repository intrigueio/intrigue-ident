module Intrigue
  module Ident
  module Check
    class Haskell < Intrigue::Ident::Check::Base
  
      def generate_checks(url)
        [
          {
            type: "fingerprint",
            category: "application",
            tags: ["Web Framework"],
            vendor:"Haskell",
            product:"Snap",
            description:"server header",
            version: nil,
            match_type: :content_headers,
            match_content:  /server: Snap\/[\d\.]+$/i,
            dynamic_version: lambda { |x|
              _first_header_capture(x,/server: Snap\/([\d\.]+)$/i)
            },
            paths: [ { path: "#{url}", follow_redirects: true } ],
            inference: false
          }
        ]
      end
  
    end
  end
  end
  end
  