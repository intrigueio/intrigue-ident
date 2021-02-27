module Intrigue
  module Ident
  module Check
  class Baidu < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Search","SaaS"],
          vendor: "Baidu",
          product:"Baidu",
          description:"favicon hash",
          version: nil,
          match_type: :checksum_body_mmh3,
          match_content: -1104297575,
          paths: [ { path: "#{url}/favicon.ico", follow_redirects: true } ]
        }
      ]
    end
  end
  
  end
  end
  end
  