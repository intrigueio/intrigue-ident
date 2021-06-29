module Intrigue
    module Ident
    module Check
    class Accellion < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            type: "fingerprint",
            category: "application",
            tags: ["Appliance"],
            vendor: "Accellion",
            product: "Secure File Transfer",
            references: [ "https://www.accellion.com/platform/simple/secure-file-sharing/" ],
            version: nil,
            match_logic: :all,
            matches: [
              {
                match_type: :content_body,
                match_content: /<div title="Secured by Accellion" id="securedlogo">/,
              }
            ],
            description: "Logo in content body",
            hide: false,
            paths: [ { path: "#{url}", follow_redirects: true } ],
            inference: false
          },
          {
            type: "fingerprint",
            category: "application",
            tags: ["Appliance"],
            vendor: "Accellion",
            product: "Kiteworks",
            references: [ "https://www.accellion.com/kiteworks/" ],
            match_logic: :all,
            matches: [
              {
                match_type: :content_title,
                match_content: /^kiteworks$/,
              }
            ],
            description: "page title",
            hide: false,
            paths: [ { path: "#{url}/index.html", follow_redirects: true } ],
            inference: false
          }
        ]
      end
    end
    end
    end
    end
