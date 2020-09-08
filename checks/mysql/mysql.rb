module Intrigue
module Ident
module MysqlCheck
class Mysql < Intrigue::Ident::MysqlCheck::Base

  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Mysql Server"],
        :vendor => "Mysql",
        :product => "Mysql",
        :references => [],
        :version => nil,
        :match_type => :content_error,
        :match_content => /not allowed to connect to this MySQL server/i,
        :match_details => "generic error",
        :hide => false,
        :inference => false
      }
    ]
  end
end
end
end
end
