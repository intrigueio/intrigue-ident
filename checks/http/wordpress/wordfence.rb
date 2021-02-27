module Intrigue
  module Ident
  module Check
  class Wordfence < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["Wordpress Plugin", "Security"],
          vendor:"Wordfence",
          product:"Wordfence",
          description:"plugin",
          references: [],
          match_type: :content_body,
          match_content:  /wordfence_lh=/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          require_product: "Wordpress",
          inference: false
        },
        {
          type: "fingerprint",
          category: "application",
          tags: ["Wordpress Plugin", "Security"],
          vendor:"Wordfence",
          product:"Wordfence",
          description:"plugin",
          references: [],
          match_type: :content_body,
          match_content:  /wordfence_syncAttackData[\?\"\=]/i,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          require_product: "Wordpress",
          inference: false
        }
      ]
    end
  
  end
  end
  end
  end
  