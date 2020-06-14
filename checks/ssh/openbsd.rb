module Intrigue
module Ident
module SshCheck
  class Openbsd < Intrigue::Ident::SshCheck::Base
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "operating_system",
          :tags => ["SSH Server"],
          :vendor => "OpenBSD",
          :product => "OpenSSH",
          :references => [],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /SSH-2.0-OpenSSH_\d+\.\d+\r\n/i,
          :dynamic_version => lambda { |x| _first_banner_capture(x, /^SSH-2.0-OpenSSH_(\d+\.\d+)\r\n$/i)},
          :match_details => "banner",
          :hide => false,
          :inference => true
        }, 
        {
          :type => "fingerprint",
          :category => "operating_system",
          :tags => ["SSH Server"],
          :vendor => "OpenBSD",
          :product => "OpenSSH",
          :match_type => :content_banner,
          :match_content => /OpenSSH/i,
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
