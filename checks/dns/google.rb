module Intrigue
  module Ident
  module DnsCheck
  class Microsoft < Intrigue::Ident::DnsCheck::Base
  
    def generate_checks
      [
        {
          :type => "fingerprint",
          :category => "operating_system",
          :tags => ["DnsServer"],
          :vendor => "Google",
          :product => "Eero",
          :website => "https://eero.com/",
          :references => [],
          :match_type => :version,
          :match_content => /^eero$/i,
        }
      ]
    end
  end
  end
  end
  end
  