module Intrigue
  module Ident
  module Check
  class Porkbun < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Parked"],
          :vendor => "Porkbun",
          :product => "Porkbun",
          :website => "https://porkbun.com/",
          :references => [],
          :version => nil,
          :match_type => :content_body,
          :match_content => /Parked on The Bun\!/i,
          :match_details => "unique body string",
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  