module Intrigue
  module Ident
    module Check
      class Ovh < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "service",
              tags: ["Hosting", "Cloud"],
              vendor: "OVH",
              product: "OVH",
              website: "https://www.ovh.it/hosting-web/faq/",
              version: nil,
              match_type: :content_body,
              match_content: /è stato registrato in ovh\.<\/p>/i,
              description: "è stato registrato in ovh\.<\/p>",
              hide: false,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
            {
              type: "fingerprint",
              category: "service",
              tags: ["Hosting", "Cloud"],
              vendor: "OVH",
              product: "OVH",
              website: "https://www.ovh.it/hosting-web/faq/",
              version: nil,
              match_type: :content_title,
              match_content: /Complimenti! Hai registrato il tuo dominio in OVH!/i,
              description: "Complimenti! Hai registrato il tuo dominio in OVH!",
              hide: false,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
          ]
        end
      end
    end
  end
end
