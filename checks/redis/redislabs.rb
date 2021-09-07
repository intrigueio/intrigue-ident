module Intrigue
  module Ident
  module RedisCheck
  class RedisCheck < Intrigue::Ident::RedisCheck::Base

    def generate_checks
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ["RedisServer", "Database"],
          vendor: "Redislabs",
          product: "Redis",
          references: [],
          version: nil,
          match_type: :content_redis_version,
          match_content: /[\d\.]+/i,
          dynamic_version: lambda { |x| _info_key_capture(x, "redis_version")},
          description: "redis version",
          inference: true
        }
      ]
    end
  end
  end
  end
  end
