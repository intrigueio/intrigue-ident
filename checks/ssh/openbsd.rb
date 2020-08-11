module Intrigue
module Ident
module SshCheck
  class Openbsd < Intrigue::Ident::SshCheck::Base
    def generate_checks
      [
        # SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.8
        # TODO... how to handle ubuntu here?
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["SSHServer"],
          :vendor => "OpenBSD",
          :product => "OpenSSH",
          :references => [],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /SSH-2.0-OpenSSH_.*\r\n/i,
          :dynamic_version => lambda { |x| _first_banner_capture(x, /^SSH-2.0-OpenSSH_([\.\d\w]+)\s.*\r\n$/i)},
          :match_details => "banner",
          :hide => false,
          :inference => true
        }, 
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["SSHServer"],
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
          :category => "application",
          :tags => ["SSHServer"],
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
