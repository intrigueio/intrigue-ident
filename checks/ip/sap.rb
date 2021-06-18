module Intrigue
  module Ident
    module IpCheck
      class SAP < Intrigue::Ident::IpCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Tcp SAP],
              vendor: 'SAP',
              product: 'SAProuter',
              description: 'match via protocol response string',
              references: [
                'https://support.sap.com/en/tools/connectivity-tools/saprouter.html'
              ],
              request_type: :hex,
              protocol: :tcp,
              request_content: '57484f415245594f553f0a',
              # match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
              match_content: /^.*SAProuter.*$/i
            }
          ]
        end
      end
    end
  end
end
