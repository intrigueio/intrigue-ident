module Intrigue
  module Ident
  module Check
  class ContactFormSeven < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["Wordpress Plugin"],
          vendor:"Contact Form 7",
          product:"Contact Form 7",
          description:"plugin",
          references: [],
          match_logic: :all,
          matches: [
            {
              match_type: :content_body,
              match_content:  /wordfence_lh=/i,
            }
          ],
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
  