module Intrigue
module Ident
module MysqlCheck
class Canonical < Intrigue::Ident::MysqlCheck::Base

  def generate_checks
    [ 
      { #5.5.5-10.1.44-MariaDB-0ubuntu0.18.04.1
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["OperatingSystem"],
        :vendor => "Canonical",
        :product => "Ubuntu Linux",
        :match_type => :content_error,
        :match_content => /ubuntu0.[\d\.]+/i,
        :dynamic_version => lambda { |x| _first_error_capture(x, /ubuntu0.([\d\.]+)/i)},
        :match_details => "mariadb message",
        :hide => false,
        :inference => true
      }
    ]
  end
end
end
end
end
