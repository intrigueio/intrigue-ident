module Intrigue
  module Ident
  module Pop3Check
  class Godaddy < Intrigue::Ident::Pop3Check::Base
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Pop3Server"],
          :vendor => "Godaddy",
          :product => "Pop Service (Dovecot)",
          :references => [],
          :version => nil,
          :match_type => :content_banner,
          :match_content => /^\+OK Fenix ready\.\r\n$/,
          :match_details => "godaddy defaults to this banner",
          :hide => false,
          :inference => false
        }
      ]
    end
  end
  end
  end
  end
  