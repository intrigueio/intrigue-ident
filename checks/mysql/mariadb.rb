module Intrigue
module Ident
module MysqlCheck
class Mysql < Intrigue::Ident::MysqlCheck::Base

  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["MysqlServer", "DatabaseService"],
        :vendor => "MariaDB",
        :product => "MariaDB",
        :references => [],
        :version => nil,
        :match_type => :content_error,
        :match_content => /[\d\.]+-[\d\.]+-MariaDB-.*$/i,
        :dynamic_version => lambda { |x| _first_error_capture(x, /[\d\.]+-([\d\.]+)-MariaDB-/i)},
        :match_details => "mariadb message",
        :hide => false,
        :inference => false
      }
    ]
  end
end
end
end
end
