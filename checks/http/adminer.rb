module Intrigue
    module Ident
    module Check
    class Adminer < Intrigue::Ident::Check::Base
    
      def generate_checks(url)
        [
          {
            type: "fingerprint",
            category: "service",
            tags: ["panel"],
            website: "https://www.adminer.org/",
            vendor: "Adminer",
            product: "Adminer",
            version: nil,
            match_type: :content_body,
            match_content: /Login \- Adminer/,
            description: "body content match",
            hide: false,
            paths: [ { path: "#{url}", follow_redirects: true } ],
            inference: false,
            dynamic_version: lambda{ |x|
          _first_body_capture(x,/<span class\=\"version\">(\d+(.\d+)?(.\d+)?)/)},
          }
        ]
      end
      
    end
    end
    end
    end
    