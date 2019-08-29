module Intrigue
module Ident
module SnmpCheck
class Cisco < Intrigue::Ident::SnmpCheck::Base

  def generate_checks 
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["SNMP Server", "Networking", "Router"],
        :vendor => "Cisco",
        :product => "IOS XE",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /Virtual XE Software/i,
        :dynamic_version => lambda { |x| _first_banner_capture(x, /Version (.*), RELEASE SOFTWARE/i)},
        :match_details => "banner",
        :hide => false,
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["SNMP Server", "Networking", "Router"],
        :vendor => "Cisco",
        :product => "IOS XE",
        :references => [],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /^Cisco IOS Software, IOS-XE Software/i,
        :dynamic_version => lambda { |x| _first_banner_capture(x, /Version (.*), RELEASE SOFTWARE/i)},
        :match_details => "banner",
        :hide => false,
        :inference => true
      }
    ]
  end
end
end
end
end
