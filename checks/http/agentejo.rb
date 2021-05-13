module Intrigue
  module Ident
    module Check
      module Private
        class Agentejo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                type: "fingerprint",
                category: "service",
                tags: ["CMS"],
                vendor: "Agentejo",
                product: "Cockpit",
                website: "https://getcockpit.com/",
                description: "Agentejo Cockpit CMS",
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
