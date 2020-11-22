module Intrigue
    module Ident
    module SnmpCheck
    class SonicWall < Intrigue::Ident::SnmpCheck::Base
    
      def generate_checks 
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["SNMPServer", "Networking", "Firewall"],
            :vendor => "SonicWall",
            :product => "SonicOS",
            :references => [],
            :version => nil,
            :match_type => :content_banner,
            :match_content => /SonicWALL/i,
            :dynamic_version => lambda { |x| _first_banner_capture(x, /(\d\.\d\.\d\.\d\-?\w*)/i)},
            :match_details => "snmp banner",
            :hide => false,
            :inference => false
          }
        ]
      end
    end
    end
    end
    end
    