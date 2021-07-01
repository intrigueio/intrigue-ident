module Intrigue
    module Ident
    module IpCheck
    class MicrosoftRDP < Intrigue::Ident::IpCheck::Base
      def generate_checks
        [
          {
            type: "fingerprint",
            category: "operating_system",
            tags: ["Tcp", "Windows", "RDP"],
            vendor: "Microsoft",
            product: "Remote desktop",
            references: [],
            version: nil,
            protocol: :tcp,
            request_type: :hex,
            request_content: "0300002a25e00000000000436f6f6b69653a206d737473686173683d746573740d0a010008000b000000",
            #match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
            match_content: /^030000130ed00000123400021f080008000000$/i,
            description: "match via protocol hex string",
            hide: false,
            inference: false
          }
        ]
      end
    end
    end
    end
end