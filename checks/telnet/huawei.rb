module Intrigue
module Ident
module TelnetCheck
class Huawei < Intrigue::Ident::TelnetCheck::Base
  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Telnet Server"],
        :vendor => "Huawei",
        :product => "Home Gateway",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /Welcome Visiting Huawei Home Gateway/i,
        :match_details => "banner",
        :hide => false,
        :inference => false
      }
    ]
  end
end
end
end
end
