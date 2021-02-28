module Intrigue
  module Ident
  module DnsCheck
  class Microsoft < Intrigue::Ident::DnsCheck::Base
  
    def generate_checks
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["DNSServer"],
          vendor: "Microsoft",
          product: "DNS Server",
          references: [],
          match_type: :version,
          match_content: /Microsoft/i,
        }
      ]
    end
  end
  end
  end
  end
  