module Intrigue
  module Ident
    module IpCheck
      class SAP < Intrigue::Ident::IpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Network Tcp SAP],
              vendor: 'SAP',
              product: 'SAProuter',
              description: 'match via protocol response string',
              references: [
                'https://support.sap.com/en/tools/connectivity-tools/saprouter.html'
              ],
              request_type: :plain,
              protocol: :tcp,
              request_content: "WHOAREYOU?",
              # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
              match_content: /^.*SAProuter.*$/i
            }
          ]
        end
      end
    end
  end
end
