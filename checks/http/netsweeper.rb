module Intrigue
  module Ident
  module Check
  class Netsweeeper < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["Administrative"],
          vendor: "Netsweeper",
          product: "Netsweeper",
          website: "https://www.netsweeper.com/",
          description:"powered by string",
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /alt=\"Powered by netsweeper\"/i,
            }
          ],
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "application",
          tags: ["Administrative"],
          vendor: "Netsweeper",
          product: "Netsweeper",
          description:"title",
          website: "https://www.netsweeper.com/",
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_title,
              match_content:  /^Netsweeper WebAdmin$/i,
            }
          ],
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "application",
          tags: ["Administrative"],
          vendor: "Netsweeper",
          product: "Netsweeper",
          website: "https://www.netsweeper.com/",
          version: nil,
          references: ["https://ssd-disclosure.com/ssd-advisory-netsweeper-preauth-rce/",
          "https://portswigger.net/daily-swig/severe-rce-vulnerability-in-content-filtering-system-has-been-patched-netsweeper-says"],
            match_logic: :all,
            matches: [
              {
                match_type: :content_body,
                match_content:  /Version: ([\d.]+)/i,
              }
            ],
          description: "exposed page, fixed in current (2020) versions",
          dynamic_version: lambda { |x| 
            _first_header_capture(x,/Version: ([\d.]+)/i) },
          paths: [{ path: "#{url}/webadmin/tools/systemstatus_remote.php", follow_redirects: true } ],
          require_product: "Netsweeper",
          inference: false
        }
      ]
    end
  end
  end
  end
  end
  