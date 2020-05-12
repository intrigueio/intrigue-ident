module Intrigue
module Ident
module SshCheck
  class OpenSsh < Intrigue::Ident::SshCheck::Base
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "operating_system",
          :tags => ["SSH Server"],
          :vendor => "OpenSSH",
          :product => "OpenSSH",
          :references => [],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /OpenSSH/i,
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
