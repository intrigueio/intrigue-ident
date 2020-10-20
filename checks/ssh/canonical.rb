module Intrigue
module Ident
module SshCheck
  class Ubuntu < Intrigue::Ident::SshCheck::Base
    def generate_checks
      [
        { # SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.8
          :type => "fingerprint", 
          :category => "operating_system",
          :tags => ["OperatingSystem"],
          :vendor => "Canonical",
          :product => "Ubuntu Linux",
          :references => ["https://launchpad.net/ubuntu/xenial/amd64/openssh-server/1:7.2p2-4ubuntu2.8"],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /Ubuntu/i,
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
