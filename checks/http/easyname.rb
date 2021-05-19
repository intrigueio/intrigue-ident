  module Intrigue
  module Ident
  module Check
  class EasyName < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "EasyName",
          product: "EasyName",
          website: "https://www.easyname.com/",
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /\<h1\>Domain\ geparkt\<\/h1\>/i,
            }
          ],
          description: "<h1>Domain geparkt</h1>",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "EasyName",
          product: "EasyName",
          website: "https://www.easyname.com/",
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_title,
              match_content: /easyname\ \|\ Domain geparkt/i,
            }
          ],
          description: "Park\ your\ Domain\ \@\ Nexicom",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        }
      ]
    end

  end
  end
  end
  end
