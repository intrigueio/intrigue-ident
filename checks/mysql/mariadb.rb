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
              vendor: 'MariaDB',
              product: 'MariaDB',
              references: [],
              version: nil,
              match_type: :content_error,
              match_content: /[\d.]+-[\d.]+-MariaDB-.*$/i,
              dynamic_version: ->(x) { _first_error_capture(x, /[\d.]+-([\d.]+)-MariaDB-/i) },
              description: 'mariadb message',
              hide: false,
              inference: false
            }
          ]
        end
      end
    end
  end
end
