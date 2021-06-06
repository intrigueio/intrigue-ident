module Intrigue
  module Ident
  module Check
  class Dan < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "DAN.com",
          product: "DAN.com",
          website: "https://dan.com/",
          references: [],
          version: nil,
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content: /There are millions of other domains available on DAN\.COM\. You can probably find the one that fits you best!/i,
            }
          ],
          description: "There are millions of other domains available on DAN\.COM\. You can probably find the one that fits you best!",
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
