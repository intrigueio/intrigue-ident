module Intrigue
  module Ident
    module MysqlCheck
      class Mysql < Intrigue::Ident::MysqlCheck::Base
        def generate_checks
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Database'],
              vendor: 'Mysql',
              product: 'Mysql',
              references: [],
              version: nil,
              match_type: :content_error,
              match_content: /not allowed to connect to this MySQL server/i,
              description: 'generic error',
              hide: false,
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Database'],
              vendor: 'Mysql',
              product: 'Mysql',
              references: [],
              version: nil,
              match_type: :content_error,
              match_content: /blocked because of many connection errors/i,
              description: 'blocked error',
              hide: false,
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Database'],
              vendor: 'Mysql',
              product: 'Mysql',
              references: [],
              match_type: :content_error,
              match_content: /[\d.]+-Max/i,
              dynamic_version: ->(x) { _first_error_capture(x, /(\d+\.\d+\.\d+)-Max/i) },
              description: 'mysql max version string',
              hide: false,
              inference: false
            }
          ]
        end
      end
    end
  end
end
