module Intrigue
    module Ident
    module Check
    class Loginizer < Intrigue::Ident::Check::Base
    
      def generate_checks(url)
        [
          {
            type: "fingerprint",
            category: "application",
            tags: ["Wordpress Plugin"],
            vendor:"Wordpress",
            product:"Loginizer",
            description:"readme file",
            match_type: :content_body,
            match_content:  /=== Loginizer ===/i,
            dynamic_version: lambda { |x|
              _first_body_capture(x,/Stable tag\: (\d+\.\d+\.\d+)/i)
            },
            paths: [ { path: "#{url}/wp-content/plugins/loginizer/readme.txt", follow_redirects: true } ],
            require_product: "Wordpress",
            inference: false
          }
        ]
      end
    
    end
    end
    end
    end
    