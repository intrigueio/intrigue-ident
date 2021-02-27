module Intrigue
  module Ident
  module SshCheck
  class ArrayOs < Intrigue::Ident::SshCheck::Base
  
    def generate_checks
      [
        {
          type: "fingerprint",
          category: "operating_system",
          tags: ["SSHServer"],
          vendor: "Array Networks",
          product: "ArrayOS",
          references: [],
          version: nil,
          match_type: :content_banner,
          match_content: /^ArrayOS$/i,
          description: "banner",
          hide: false,
          inference: false
        }
      ]
    end
  end
  end
  end
  end
  