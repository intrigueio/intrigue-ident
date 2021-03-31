module Intrigue
    module Ident
    module Check
    class Cambium < Intrigue::Ident::Check::Base
    
      def generate_checks(url)
        [
          {
            type: "fingerprint",
            category: "hardware",
            tags: ["Embedded", "Networking"],
            vendor:"Cambium",
            product: nil,
            description: "page title",
            match_type: :content_body,
            match_content:  /<title>ePMP/,
            version: nil, 
            paths: [ { path: "#{url}", follow_redirects: true } ],
            inference: false
          },
          {
            type: "fingerprint",
            category: "hardware",
            tags: ["Embedded", "Networking"],
            vendor:"Cambium",
            product: nil,
            description: "server header",
            match_type: :content_headers,
            match_content:  /^Server: Cambium HTTP Server$/,
            version: nil,
            paths: [ { path: "#{url}", follow_redirects: true } ],
            inference: false
          },
          # 
        ]
      end
    
    end
    end
    end
    end
    