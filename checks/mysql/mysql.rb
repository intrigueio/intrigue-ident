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
        :vendor => "Mysql",
        :product => "Mysql",
        :references => [],
        :version => nil,
        :match_type => :content_error,
        :match_content => /not allowed to connect to this MySQL server/i,
        :match_details => "generic error",
        :hide => false,
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["MysqlServer", "DatabaseService"],
        :vendor => "Mysql",
        :product => "Mysql",
        :references => [],
        :version => nil,
        :match_type => :content_error,
        :match_content => /blocked because of many connection errors/i,
        :match_details => "blocked error",
        :hide => false,
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["MysqlServer", "DatabaseService"],
        :vendor => "Mysql",
        :product => "Mysql",
        :references => [],
        :match_type => :content_error,
        :match_content => /[\d.]+-Max/i,
        :dynamic_version => lambda { |x| _first_error_capture(x, /(\d+\.\d+\.\d+)-Max/i)},
        :match_details => "mysql max version string",
        :hide => false,
        :inference => false
      }
    ]
  end
end
end
end
end
