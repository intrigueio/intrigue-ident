module Intrigue
  module Ident
    module Check
      module Private
        class CockpitCms < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                type: "fingerprint",
                category: "application",
                tags: ["CMS",],
                vendor: "Cockpit",
                product: "CMS",
                website: "https://getcockpit.com/",
                description: "Cockpit CMS",
                version: nil,
                match_type: :content_title,
                match_content: /^Authenticate Please!$/i,
                paths: [{ path: "#{url}", follow_redirects: true }],
                inference: false,
              }
            ]
          end
        end
      end
    end
  end
end
