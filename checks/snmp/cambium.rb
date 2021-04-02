module Intrigue
    module Ident
    module SnmpCheck
    class Cambium < Intrigue::Ident::SnmpCheck::Base
    
      def generate_checks 
        [
          {
            type: "fingerprint",
            category: "application",
            tags: ["SNMPServer", "Networking"],
            vendor: "Cambium",
            product: "ePMP 3000 AP",
            references: [],
            version: nil,
            match_type: :content_banner,
            match_content: /Linux ePMP 3000/i,
            description: "snmp banner",
            hide: false,
            inference: false
          }
        ]
      end
    end
    end
    end
    end