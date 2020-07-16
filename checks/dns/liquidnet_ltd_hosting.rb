module Intrigue
module Ident
module DnsCheck
class Microsoft < Intrigue::Ident::DnsCheck::Base

  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["DnsServer"],
        :vendor => "LiquidNet Ltd Hosting",
        :product => "LiquidNet DNS",
        :website => "https://www.liquidnetlimited.com/services.html",
        :references => [],
        :match_type => :version,
        :match_content => /^LiquidNet DNS$/i,
      }
    ]
  end
end
end
end
end
